# Quick Reference - App Updates

## Summary of Changes

### What Was Changed
1. **NavBar** - Made fully responsive with active search
2. **Footer** - Made fully functional with clickable elements
3. **Dependencies** - Added `url_launcher: ^6.2.4`

---

## NavBar Features

### Desktop (≥768px)
```
[FULLHOUSE]  [가이드] [프로젝트] [프로모션] [커뮤니티]  [🔍] [👤] [로그인]
```

### Mobile (<768px)
```
[FULLHOUSE]  [🔍] [☰]
             └─→ Bottom Sheet Menu
                 ├─ 가이드
                 ├─ 프로젝트
                 ├─ 프로모션
                 ├─ 커뮤니티
                 ├─ 프로필
                 └─ 로그인
```

---

## Footer Features

### Clickable Elements
- 📱 **Social Icons**: Facebook, Instagram, Twitter (open social media)
- 📝 **Footer Text**: Opens contact page
- 🔗 **Menu Items**: All open respective pages

### Footer Sections
1. **회사** (Company)
   - 소개, 팀, 채용, 블로그

2. **서비스** (Services)
   - NPL 경매, 컨설팅, 분석, 리포트

3. **고객지원** (Support)
   - 고객센터, 이용약관, 개인정보처리방침, 문의하기

---

## Pages Updated
- ✅ HomePage (NPLHomeScreen)
- ✅ PromotionPage
- ✅ GuidePage
- ✅ CommunityPage
- ✅ ProjectPage

---

## Testing Quick Steps

1. **Test Responsiveness**
   - Resize browser to <768px
   - Verify mobile menu appears
   - Check all layouts adapt

2. **Test Search**
   - Click search icon
   - Enter text
   - Submit and verify feedback

3. **Test Navigation**
   - Click navbar menu items
   - Click footer menu items
   - Verify pages load

4. **Test Social Links**
   - Click Facebook icon
   - Click Instagram icon
   - Click Twitter icon
   - Verify URLs open

5. **Test Footer Text**
   - Click copyright text
   - Verify contact page opens

---

## Key Files

| File | Changes |
|------|---------|
| `lib/widgets/nav_bar.dart` | Responsive navbar with search |
| `lib/widgets/footer.dart` | Clickable footer elements |
| `pubspec.yaml` | Added url_launcher dependency |

---

## Responsive Breakpoints

| Component | Mobile | Tablet | Desktop |
|-----------|--------|--------|---------|
| NavBar | Hamburger menu | Hamburger menu | Full menu |
| Footer | Vertical stack | Vertical stack | Horizontal |
| NavBar Breakpoint | - | 768px | - |
| Footer Breakpoint | - | 1100px | - |

---

## URL Mappings

### Social Media
- Facebook: https://www.facebook.com/fullhouse
- Instagram: https://www.instagram.com/fullhouse
- Twitter: https://twitter.com/fullhouse

### Company Menu
- 소개: /about
- 팀: /team
- 채용: /careers
- 블로그: /blog

### Services Menu
- NPL 경매: /auction
- 컨설팅: /consulting
- 분석: /analysis
- 리포트: /reports

### Support Menu
- 고객센터: /support
- 이용약관: /terms
- 개인정보처리방침: /privacy
- 문의하기: /contact

---

## Commands to Deploy

```bash
# Get dependencies
flutter pub get

# Check for errors
flutter analyze

# Run app
flutter run

# Build APK (Android)
flutter build apk

# Build IPA (iOS)
flutter build ios
```

---

## Dependency Added

```yaml
url_launcher: ^6.2.4
```

This enables:
- Opening URLs in browser
- Opening social media apps
- Reliable external link launching

---

## Support

For issues or questions:
1. Check console for errors
2. Verify url_launcher is properly configured
3. Test on actual device, not just emulator
4. Update social media URLs to your accounts

---

**Version:** 1.0  
**Status:** ✅ Complete  
**Date:** January 28, 2026
