#!/bin/bash
# Renames portfolio assets to web-safe filenames.
# USAGE: put this file in your "portfolio folder", then in Terminal:
#   cd "/path/to/portfolio folder"
#   bash rename-assets.sh
#
# Safe to run twice — it skips anything already renamed.

set -u
mv_if () { [ -e "$1" ] && mv "$1" "$2" && echo "  ✓ $2"; }

echo "paintings/"
cd assets/paintings 2>/dev/null && {
  mv_if "Landing page reference.png"        "landing-page-reference.png"
  mv_if "Loading page 0-100% reference.png" "loading-page-reference.png"
  cd ../..
}

echo "wbeauty/"
cd assets/wbeauty 2>/dev/null && {
  mv_if "interview protocol table.png"                                                    "interview-protocol.png"
  mv_if "Persona card1.png"                                                               "persona-julia.png"
  mv_if "Persona card2.png"                                                               "persona-lila.png"
  mv_if "Storyboard — Julia's journey from overwhelmed friend-favors to certified nail tech.png" "storyboard-julia.png"
  mv_if "Low-fi overview.png"                                                             "lofi-overview.png"
  mv_if "High-fidelity key screens — booking flow.png"                                    "hifi-booking-flow.png"
  mv_if "Figure 1 — color & tab bar separation.png"                                       "figure-1-color-tabbar.png"
  mv_if "High-fidelity key screens — artist shop + chat.png"                              "hifi-shop-chat.png"
  mv_if "QR attendance confirmation screen — artist presents code, client scans, +10 tokens transfer.png" "qr-attendance.png"
  mv_if "user testing protocol.png"                                                       "usability-test-tasks.png"
  mv_if "Design 1 sketch.png"                                                             "design-sketch-1.png"
  mv_if "Design 2 sketch.png"                                                             "design-sketch-2.png"
  # hero screens live in their own subfolder
  [ -d "Hero images" ] && mv "Hero images" "hero" && echo "  ✓ hero/"
  cd hero 2>/dev/null && {
    mv_if "Home Page_Client.png"              "home-client.png"
    mv_if "Person B Client - Audrey.png"      "profile-client.png"
    mv_if "Profile Page 1 - Artist - Yuchen.png" "profile-artist.png"
    mv_if "Shop Page - from tab bar.png"      "shop-artist.png"
    cd ..
  }
  cd ../..
}

echo "lets-fly-now/"
cd assets/lets-fly-now 2>/dev/null && {
  mv_if "High-fidelity form pages — pilot sign-up, volunteer page, logbooks.png" "hifi-form-pages.png"
  mv_if "Landing page — full scroll, in device mockup.png"                       "landing-page-full.png"
  mv_if "Low-fidelity wireframes — the full flow map.png"                        "lofi-wireframes.png"
  cd ../..
}

echo "bee-my-eyes/"
cd assets/bee-my-eyes 2>/dev/null && {
  # NOTE: the "/" in the original name is stored as ":" by macOS
  mv_if "Results : suppression score screen.png" "results-suppression-score.png"
  mv_if "Results / suppression score screen.png" "results-suppression-score.png"
  mv_if "Game page screen.png"                   "game-page.png"
  mv_if "Homepage screen.png"                    "homepage.png"
  cd ../..
}

echo "art/"
cd assets/art 2>/dev/null && {
  [ -d artproject1 ] && cd artproject1 && {
    mv_if "Yuchen_Xiao_ARTS340SP26_Project1_1.jpg"           "project-1-final.jpg"
    mv_if "Yuchen_Xiao_ARTS340SP26_Project1_Process1.jpg"    "project-1-process-1.jpg"
    mv_if "Yuchen_Xiao_ARTS340SP26_Project1_Process2.jpg"    "project-1-process-2.jpg"
    mv_if "Yuchen_Xiao_ARTS340SP26_Project1_Description.pdf" "project-1-description.pdf"
    cd ..
  }
  [ -d artproject2 ] && cd artproject2 && {
    mv_if "Isabel_Li_Yuchen_Xiao_ARTS340SP26_Project3_2.jpg"        "project-2-final-1.jpg"
    mv_if "Isabel_Li_Yuchen_Xiao_ARTS340SP26_Project3_3.JPG"        "project-2-final-2.jpg"
    mv_if "Isabel_Li_Yuchen_Xiao_ARTS340SP26_Project3_Description.pdf" "project-2-description.pdf"
    cd ..
  }
  [ -d artproject3 ] && cd artproject3 && {
    mv_if "Yuchen_Xiao_ARTS340SP26_Project4_1.jpeg"          "project-3-final-1.jpg"
    mv_if "Yuchen_Xiao_ARTS340SP26_Project4_2.jpeg"          "project-3-final-2.jpg"
    mv_if "Yuchen_Xiao_ARTS340SP26_Project4_Description.pdf" "project-3-description.pdf"
    cd ..
  }
  [ -d artproject4 ] && cd artproject4 && {
    mv_if "IMG_8950.jpeg"                            "project-4-final-1.jpg"
    mv_if "IMG_8962.jpeg"                            "project-4-final-2.jpg"
    mv_if "YUCHENXIAO_ 2DFA25_FINALPROJECT_DESCRIPTION" "project-4-description.pdf"
    cd ..
  }
  cd ../..
}

echo ""
echo "Done. Note: mountain.png, headshot.jpg, rain-reference.jpg were already fine."
