import React, { useState, useEffect } from 'react'

interface Props {
  onPlaylistSelection: (playlist: Playlist) => void
}

export interface Playlist {
  id: number;
  name: string;
  creator: string;
  description: string;
  tracks: string[];
}

const PlaylistBar: React.FC<Props> = ({ onPlaylistSelection }) => {
  const [playlists, setPlaylists] = useState<Playlist[]>([]);
  const [activePlaylist, setActivePlaylist] = useState<Playlist | null>(null);
  const [expanded, setExpanded] = useState<boolean>(true);

  useEffect(() => {
    fetch("http://localhost:4567/playlists")
      .then((res) => res.json())
      .then((data) => setPlaylists(data))
      .catch(console.error);
  }, []);

  useEffect(() => {
    if (playlists.length && !activePlaylist) {
      setActivePlaylist(playlists[0]);
    }
  }, [playlists]);

  useEffect(() => {
    if (activePlaylist) {
      onPlaylistSelection(activePlaylist)
    }
  }, [activePlaylist]);

  return (
    <div className={`bg-neutral-900 text-neutral-200 p-3 h-full flex flex-col transition-all duration-300 ${expanded ? 'w-86' : 'w-20'}`}>
      {/* Collapse Button */}
      <button
        onClick={() => setExpanded(!expanded)}
        className="ml-1 mb-4 bg-neutral-700 hover:bg-neutral-600 rounded-xl w-8 h-8 flex items-center justify-center transition"
      >
        {expanded ? '–' : '+'}
      </button>

      {/* Playlist List */}
      <div className="flex flex-col gap-2">
        {playlists.map((playlist) => (
          <div
            key={playlist.id}
            onClick={() => setActivePlaylist(playlist)}
            className={`flex items-center gap-3 cursor-pointer p-2 rounded-xl transition-colors ${
              activePlaylist?.id === playlist.id
                ? 'bg-red-900'
                : 'hover:bg-neutral-700'
            }`}
          >
            {/* Icon (circle) */}
            <div className="w-6 h-6 rounded-full bg-neutral-500 shrink-0" />
            {/* Title */}
            {expanded && <span className="truncate">{playlist.name}</span>}
          </div>
        ))}
      </div>
    </div>
  );
};

export default PlaylistBar;
