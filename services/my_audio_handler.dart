import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer _audioplayer = AudioPlayer();

  AudioSource _createAudioSource(MediaItem item) {
    return AudioSource.uri(Uri.parse(item.id));
  }

  void listenToIndexChange() {
    _audioplayer.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) {
        return;
      }
      mediaItem.add(playlist[index]);
    });
  }

  void _broadcastState() {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          _audioplayer.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: {
          MediaAction.seek,
          MediaAction.seekBackward,
          MediaAction.seekForward,
        },
        processingState: const{
          ProcessingState.idle:AudioProcessingState.idle,
          ProcessingState.loading:AudioProcessingState.loading,
          ProcessingState.ready:AudioProcessingState.ready,
          ProcessingState.buffering:AudioProcessingState.buffering,
          ProcessingState.completed:AudioProcessingState.completed,
        }[_audioplayer.processingState]!,
        playing:_audioplayer.playing,
        updatePosition: _audioplayer.position,
        bufferedPosition: _audioplayer.bufferedPosition,
        speed: _audioplayer.speed,
        queueIndex: _audioplayer.currentIndex,

      ),
    );
  }
  Future<void> initSongs({required List<MediaItem> songs})async{
    _audioplayer.playbackEventStream.listen((event) => _broadcastState());
    final audioSource = songs.map(_createAudioSource);
    // ignore: deprecated_member_use
    await _audioplayer.setAudioSource(ConcatenatingAudioSource(children: audioSource.toList()));
    final newQueue = List<MediaItem>.from(queue.value)..addAll(songs);
    queue.add(newQueue);
    listenToIndexChange();
    _audioplayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        skipToNext();
      }
    });
  }
}