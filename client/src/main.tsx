import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route} from "react-router";
import App from './pages/App.tsx'

createRoot(document.getElementById('root')!).render(
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<App />} />
    </Routes>
  </BrowserRouter>,
)