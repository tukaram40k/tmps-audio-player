import React, { useRef, useState, useEffect } from 'react'
import type { Track } from '../TrackList.tsx'
import { type AudioAdapter, createAudioAdapter } from './file_format_adapter.ts'
import { Play, Pause } from 'lucide-react'

interface Props {
  track: Track;
}

const AudioPlayer: React.FC<Props> = ({ track }) => {
  const audioRef = useRef<HTMLAudioElement>(null)
  const [audioUrl, setAudioUrl] = useState<string | null>(null)
  const [isPlaying, setIsPlaying] = useState(false)
  const [progress, setProgress] = useState(0)
  const [duration, setDuration] = useState(0)

  useEffect(() => {
    const adapter = createAudioAdapter(track)
    const url = adapter.getUrl()
    setAudioUrl(url)
  }, [track]);

  const togglePlay = () => {
    const audio = audioRef.current
    if (!audio) return
    if (isPlaying) audio.pause()
    else audio.play()
    setIsPlaying(!isPlaying)
  };

  useEffect(() => {
    const audio = audioRef.current
    if (!audio) return

    const updateProgress = () => setProgress(audio.currentTime)
    const setAudioDuration = () => setDuration(audio.duration)

    audio.addEventListener("timeupdate", updateProgress)
    audio.addEventListener("loadedmetadata", setAudioDuration)

    return () => {
      audio.removeEventListener("timeupdate", updateProgress)
      audio.removeEventListener("loadedmetadata", setAudioDuration)
    }
  }, [])

  const handleSeek = (e: React.ChangeEvent<HTMLInputElement>) => {
    const audio = audioRef.current
    if (!audio) return
    audio.currentTime = Number(e.target.value)
    setProgress(audio.currentTime)
  };

  const formatTime = (time: number) =>
    isNaN(time)
      ? "0:00"
      : `${Math.floor(time / 60)}:${Math.floor(time % 60)
        .toString()
        .padStart(2, "0")}`

  return (
    <div className="bg-neutral-800 mx-86 text-neutral-100 p-4 flex flex-col items-center shadow-md w-full">
      <div className="font-semibold">{track.title}</div>
      <div className="text-sm text-gray-400">{track.artist}</div>

      <div className="flex items-center w-full gap-4 mt-4">
        <button
          onClick={togglePlay}
          className="bg-neutral-700 hover:bg-neutral-600 p-3 rounded-full"
        >
          {isPlaying ? <Pause size={20}/> : <Play size={20}/>}
        </button>

        <div className="flex flex-col w-full">
          <input
            type="range"
            min={0}
            max={duration || 0}
            value={progress}
            onChange={handleSeek}
            className="w-full accent-red-800 cursor-pointer"
          />
          <div className="flex justify-between text-xs text-neutral-400 mt-1">
            <span>{formatTime(progress)}</span>
            <span>{formatTime(duration)}</span>
          </div>
        </div>
      </div>

      { audioUrl && <audio ref={audioRef} src={audioUrl}/>}
    </div>
  )
}

export default AudioPlayer;
