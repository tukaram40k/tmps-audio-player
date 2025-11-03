import React from 'react'
import type {Track} from "./TrackList.tsx";

interface Props {
  track: Track | null;
}

const ActiveTrackBar: React.FC<Props> = ({ track }) => {
  return (
    <div className="bg-neutral-900 text-neutral-200 p-3 h-full flex flex-col w-86">
      {/* Active Track */}
      {track && <div>
        active track info
        <p>Title: {track.title}</p>
      </div>}
    </div>
  );
}

export default ActiveTrackBar