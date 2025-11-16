import React from 'react'
import type { Track } from "./track_proxy/proxy_track.ts";

interface Props {
  track: Track | null;
}

const ActiveTrackBar: React.FC<Props> = ({ track }) => {
  return (
    <div className="bg-neutral-900 text-neutral-200 p-3 h-full flex flex-col w-86">
      {/* Active Track */}
      {track &&
          <div>
            <div className="font-semibold">{track.title}</div>
            <div className="text-sm text-gray-400">{track.artist}</div>
            <div className="text-sm text-gray-400 mt-2">Producer: {track.producer}</div>
            <div className="text-sm text-gray-400">Album: {track.album}</div>
            <div className="text-sm text-gray-400 mt-2">File format: {track.file_format}</div>
            <div className="font-semibold mt-2">Lyrics</div>
            <div className="text-sm text-gray-400 mt-2">{track.lyrics}</div>
          </div>}
    </div>
  );
}

export default ActiveTrackBar