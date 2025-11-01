import React, { useEffect, useState } from "react";

interface Track {
  id: number;
  filename: string;
  title: string;
  artist: string;
  url: string;
}

const TrackList: React.FC = () => {
  const [tracks, setTracks] = useState<Track[]>([]);

  useEffect(() => {
    fetch("http://localhost:4567/tracks")
      .then((res) => res.json())
      .then((data) => setTracks(data))
      .catch(console.error);
  }, []);

  return (
    <div className="p-4 space-y-4">
      <h1 className="text-xl font-bold">Tracks</h1>
      {tracks.map((track) => (
        <div
          key={track.id}
          className="p-3 border rounded-2xl shadow-sm bg-white"
        >
          <div className="font-semibold">{track.title}</div>
          <div className="text-sm text-gray-600">{track.artist}</div>
          <audio controls className="mt-2 w-full">
            <source src={track.url} type="audio/mpeg" />
            Your browser does not support the audio element.
          </audio>
        </div>
      ))}
    </div>
  );
};

export default TrackList;
