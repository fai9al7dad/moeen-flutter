# moeen

## to do's

- [ ] switch text spans to Word widget?
- [x] condition colors on only words that are not ayas or bismillah or surah start
- [x] different ayah colors
- [x] shadow text -> removed due to performance ressons
- [x] make mistakes = mistakes and warnings and reverts
- [ ] optimize sql init query on android, ios->?

## testing

- [ ] test on iphone
- [ ] test on android
- [x] check if mistake persist when scrolling out of window
- [x] click on ayah numbers, should not be added to mistkes, or surah headers
- [ ] test performance on morning

## current iteration

- [ ] surah list
  - [x] surah name
  - [x] surah page from to
  - [ ] type
  - [x] mistakes and warning
  - [x] pagescount
  - [x] verses count
  - [x] click go to first page
- [ ] add surah header

## finished

- [x] word highlight = black->warning->mistake->revert
- [x] make sqlite from page to list
- [x] page header
  - [x] add juz number
  - [x] add hizb number
  - [x] page number
  - [x] show page mistakes and warnings
    - [x] click to open modal to go to page
  - [x] add page header
  - [x] surah name
    - [x] click to open surah list screen
