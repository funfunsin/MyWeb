var play = document.getElementById("play");
var stop = document.getElementById("stop");
var vol = document.getElementById("vol");
var audio = document.getElementById("audio");
var s = document.getElementById("s");
var info = document.getElementById("info");
var music = document.getElementById("music");
var prevtime = document.getElementById("prevtime");
var nexttime = document.getElementById("nexttime");
var prevsong = document.getElementById("prevsong");
var nextsong = document.getElementById("nextsong");
var muted = document.getElementById("muted");
var duration = document.getElementById("duration");
var progress = document.getElementById("progress");
var settime = document.getElementById("settime");
var loop = document.getElementById("loop");
var info2 = document.getElementById("info2");
var random = document.getElementById("random");
var allloop = document.getElementById("allloop");

audio.volume = vol.value / 100;

play.addEventListener("click", PlaySong);
vol.addEventListener('change', VolumeChange);
stop.addEventListener('click', StopSong);
music.addEventListener('change', SongSelect);
prevtime.addEventListener('click', function () { TimeChange(false) });
nexttime.addEventListener('click', function () { TimeChange(true) });
prevsong.addEventListener('click', function () { SongChange(false) });
nextsong.addEventListener('click', function () { SongChange(true) });
muted.addEventListener('click', SetMuted);
audio.addEventListener("play", getDuration);
loop.addEventListener("click", loopSong);
random.addEventListener("click", randomSong);
allloop.addEventListener("click", allloopSong);

//全曲循環
function allloopSong() {
    if (info2.innerText != "全曲循環") {
        audio.loop = false;
        info2.innerText = "全曲循環";
    }
    else {
        info2.innerText = "";
    }
}

//隨機播放
function randomSong() {
    if (info2.innerText != "隨機播放") {
        audio.loop = false;
        info2.innerText = "隨機播放"
    }
    else {
        info2.innerText = ""
    }
}

//單曲循環播放
function loopSong() {
    if (info2.innerText != "單曲循環") {
        audio.loop = true;
        info2.innerText = "單曲循環"
    }
    else {
        audio.loop = false;
        info2.innerText = ""
    }
}


//用進度bar跳至指定時間
settime.addEventListener("click", function (evnt) {
    var a = evnt.offsetX / 400;
    audio.currentTime = audio.duration * a;
});

//取得播放時間進度
function getDuration() {
    durationTime = formatSecond(audio.duration);
    //alert(durationTime);
    currentTime = formatSecond(audio.currentTime);
    //alert(currentTime)
    duration.innerText = currentTime + "/" + durationTime;
    progress.style.width = Math.floor(audio.currentTime / audio.duration * 100) + "%";


    if (audio.currentTime <= audio.duration)
        setTimeout("getDuration()", "1000");

    if (audio.duration == audio.currentTime) {

        if (info2.innerText == "隨機播放") {

            var r = Math.floor(Math.random() * music.options.length)
            s.src = music.options[r].value;
            s.title = music.options[r].text;
            music.options[r].selected = true;
            audio.load();
            btnDicision();


        }
        else {

            if (music.selectedIndex == music.options.length - 1) {
                if (info2.innerText == "全曲循環") {
                    music.selectedIndex = 0;
                    btnDicision();
                }
                else
                    StopSong();
            }
            else {
                SongChange(true);
            }
        }

    }

}



//將秒轉成時分秒
function formatSecond(secs) {
    //alert(secs);
    var h = Math.floor(secs / 3600);
    var min = Math.floor((secs - (h * 3600)) / 60);
    var sec = parseInt(secs - (h * 3600) - (min * 60));
    //alert(sec < 10);

    min = (min < 10) ? "0" + min : min;
    sec = (sec < 10) ? "0" + sec : sec;

    return min + ":" + sec;

}

//靜音功能
function SetMuted() {
    if (muted.innerText == "V") {
        audio.muted = true;
        muted.innerText = "U";
    }
    else {
        audio.muted = false;
        muted.innerText = "V";
    }

}


//上一曲下一曲
function SongChange(boolNextPrev) {
    if (boolNextPrev) {
        index = music.selectedIndex + 1;
    }
    else {
        index = music.selectedIndex - 1;
    }

    s.src = music.options[index].value;
    s.title = music.options[index].text;
    music.options[index].selected = true;
    audio.load();

    btnDicision();

}

//快轉鈕
function TimeChange(boolNextPrev) {
    if (boolNextPrev)
        audio.currentTime += 10;
    else
        audio.currentTime -= 10;

}

//音樂選擇
function SongSelect() {
    s.src = music.options[music.selectedIndex].value;
    s.title = music.options[music.selectedIndex].text;
    audio.load();
    btnDicision();
}

//判斷換歌曲時是否直接播放
function btnDicision() {
    if (play.innerText == ";") {
        play.innerText = "4";
        PlaySong();
    }

}

//音樂播放
function PlaySong() {

    if (play.innerText == "4") {
        audio.play();
        info.innerText = "現正播放:" + s.title;
        play.innerText = ";";
        //alert("ppp");
    }
    else {
        audio.pause();
        info.innerText = "音樂暫停";
        play.innerText = "4";

        //alert("sss");

    }

    //把分隔線改成動態


}

//調整音量
function VolumeChange() {

    audio.volume = vol.value / 100;

}

//音樂停止播放
function StopSong() {

    audio.pause();
    audio.currentTime = 0;
    //audio.load(); //不建議寫法
    play.innerText = "4";
    info.innerText = "音樂停止播放~~~~";

}