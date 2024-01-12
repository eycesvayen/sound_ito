import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sound_ito/gen/assets.gen.dart';

import 'package:sound_ito/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Mahşer",
        artistName: "G O K H A N  T U R K M E N",
        //albumArtImagePath: "assets/images/cover.jpg",
        albumArtImagePath: Assets.images.cover.path,
        //audioPath: "assets/audio/gokhanTurkmenMahser.mp3",
        audioPath: Assets.audio.gokhanTurkmenMahser),
    Song(
        songName: "American Horror Show",
        artistName: "S N O W  W I F E",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.horrorshow.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.americanHorrorShow),
    Song(
        songName: "Ağlama Ben Ağlarım",
        artistName: "C A N  O Z A N",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.canOzanImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.canOzanBenAglarim),
    Song(
        songName: "Sus Pus",
        artistName: "C E Z A",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.cezaImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.cezaSusPus),
    Song(
        songName: "Closer",
        artistName: "T H E  C H A I N S M O K E R S",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.chainsmokersImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.chainsmokersSong),
    Song(
        songName: "Tattoo",
        artistName: "L O R E E N",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.loreenImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.loreenTattoo),
    Song(
        songName: "Ateşe Düştüm",
        artistName: "M E R T  D E M İ R",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.mertDemirImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.mertDemirSong),
    Song(
        songName: "Sertlik Kanında Var Hayatın",
        artistName: "S A G O P A",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.sagopaImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.sagopaSong),
    Song(
        songName: "Aşkın Olayım",
        artistName: "S I M G E",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.simgeCover.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.simgeAskinOlayim),
    Song(
        songName: "Altüst Olmuşum",
        artistName: "M A V İ  G R İ",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.maviGriImage.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.maviGriSong),
    Song(
        songName: "Diva Yorgun",
        artistName: "M E L İ K E  Ş A H İ N",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.melikeSong.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.melikeDivaYorgun),
    Song(
        songName: "Ben De Yoluma Giderim",
        artistName: "S E Z E N  A K S U",
        //albumArtImagePath: "assets/images/horrorShow.jpeg",
        albumArtImagePath: Assets.images.sezenAksuCover.path,
        //audioPath: "assets/audio/americanHorrorShow.mp3")
        audioPath: Assets.audio.sezenAksuSong),
  ];

  int? _currentSongIndex;

//audioplayer
  final AudioPlayer _audioPlayer = AudioPlayer();

//duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

//constructor
  PlaylistProvider() {
    listenToDuration();
  }

  //initially not playing
  bool _isPlaying = false;

  //play the song

  // Future<void> playSound() async {
  //   String audioPath = "assets/audio";

  //   await _audioPlayer.play(AssetSource(audioPath));
  void play() async {
    // ignore: unused_local_variable
    String audioPath = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    //AudioCache.instance = AudioCache(prefix: '');
    _audioPlayer.play(AssetSource(audioPath.replaceAll("assets/", "")));

    //   await _audioPlayer.play(AssetSource(path)); // play the neew song
    _isPlaying = true;

    //_audioPlayer.setVolume(1);

    notifyListeners();
  }

//pause current song

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

//resume playing

  void resume() async {
    //await _audioPlayer.pause();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

// seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

//play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it is not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it is not the last song, loop back to the beginning
        currentSongIndex = 0;
      }
    }
  }
  //play previous song

  void playPreviousSong() async {
    //if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if it's within first 2 second of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
// if it's within first 2 second of the song, go to previous song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

//listen to duration
  void listenToDuration() {
    //listen to total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen to current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen to song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newIndex) {
    //update current song idex
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); //play the song at the new index
    }

    //update UI
    notifyListeners();
  }
}
