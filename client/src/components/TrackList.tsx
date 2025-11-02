import React, { useEffect, useState } from "react";
import TrackItem, { type Track } from "./TrackItem.tsx";
import type {Playlist} from "./PlaylistBar.tsx";

interface Props {
  playlist: Playlist;
}

const TrackList: React.FC<Props> = ({ playlist }) => {
  const [tracks, setTracks] = useState<Track[]>([])

  useEffect(() => {
    fetch("http://localhost:4567/tracks")
      .then((res) => res.json())
      .then((data) => setTracks(data))
      .catch(console.error);
  }, []);

  const filteredTracks = tracks.filter((track) =>
    playlist.tracks.includes(track.filename)
  )

  return (
    <div className="p-4 space-y-4 text-neutral-100 bg-neutral-800">
      <h1 className="text-xl font-bold">{playlist.name} — Tracks</h1>
      {filteredTracks.length > 0 ? (
        filteredTracks.map((track) => <TrackItem key={track.id} {...track} />)
      ) : (
        <p className="text-neutral-400 italic">No tracks in this playlist.</p>
      )}
    </div>
  );
};

export default TrackList;
