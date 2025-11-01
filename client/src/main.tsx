import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route} from "react-router";
import TrackList from './components/TrackList.tsx'
import './index.css'

createRoot(document.getElementById('root')!).render(
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<TrackList />} />
    </Routes>
  </BrowserRouter>,
)