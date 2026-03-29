# Command Cheatsheet - PDF Processing

Quick reference for testing, committing, and deploying.

---

## 🚀 Quick Test (30 seconds)

```bash
# Terminal 1: Start server
npm run start

# Terminal 2: Run demo
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs
```

---

## 📦 Git Commands

```bash
# View staged changes
git status
git diff --cached

# Commit with prepared message
git commit -F /tmp/commit-message.txt

# Or write your own
git commit -m "feat: Phase 1 - PDF.js processor + Playwright demos"

# Push to main
git push origin main
```

---

## 🧪 Testing

```bash
# Run PDF processor tests
npm test -- test/pdf-processor.test.ts

# Run all tests
npm test

# Run demo tests
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs
USE_NEW_PROCESSOR=true node demo/pdf-processing-demo.mjs
```

---

## 🔧 Development

```bash
# Start server (default: MOCK processor)
npm run start

# Start with NEW processor
USE_NEW_PROCESSOR=true npm run start

# Build
npm run build

# Build server only
npm run build:server

# Type check
npx tsc --noEmit
```

---

## 📊 Verification

```bash
# Check NEW processor is working
# Should see chunks > 1
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs | grep "Chunks:"

# Check MOCK processor (baseline)
# Should see chunks = 1
node demo/pdf-api-demo.mjs | grep "Chunks:"

# View server logs
npm run start | grep "processor:"
```

---

## 📁 File Locations

```bash
# View implementation
cat server/lib/pdf-processor.ts
cat server/lib/chunker.ts
cat server/workplaces/document-api.ts

# View tests
cat test/pdf-processor.test.ts

# View demos
cat demo/pdf-api-demo.mjs
cat demo/pdf-processing-demo.mjs

# View documentation
cat QUICK_START.md
cat PHASE1_COMPLETE.md
cat DEMO_IMPLEMENTATION_COMPLETE.md
```

---

## 🔍 Debugging

```bash
# Check dependencies installed
npm list pdfjs-dist
npm list pdf-to-png-converter
npm list playwright
npm list ws

# Check environment variable
echo $USE_NEW_PROCESSOR

# Test WebSocket connection
wscat -c ws://localhost:8000/ws

# View temp PDF files
ls -la /tmp/*.pdf

# Check server port
lsof -i :8000
```

---

## 🚢 Deployment

```bash
# Staging
export USE_NEW_PROCESSOR=true
export NODE_ENV=staging
npm run start

# Production (gradual rollout)
export USE_NEW_PROCESSOR=true
export NODE_ENV=production
npm run start

# Rollback (disable feature)
export USE_NEW_PROCESSOR=false
npm run start
```

---

## 📈 Performance Testing

```bash
# Benchmark NEW processor
time USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs

# Benchmark MOCK processor
time node demo/pdf-api-demo.mjs

# Compare results
echo "NEW processor:" && USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs 2>&1 | grep -E "(Chunks:|Processing)"
echo "MOCK processor:" && node demo/pdf-api-demo.mjs 2>&1 | grep -E "(Chunks:|Processing)"
```

---

## 🎥 Demo Commands

```bash
# Quick API test (recommended)
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs

# Full browser automation
USE_NEW_PROCESSOR=true node demo/pdf-processing-demo.mjs

# View demo screenshots
open demo/01-workspace.png
open demo/02-upload.png
open demo/03-processed.png

# View demo recordings
open demo/recordings/
```

---

**Quick Links:**
- [Quick Start](QUICK_START.md)
- [Phase 1 Complete](PHASE1_COMPLETE.md)
- [Demo Guide](DEMO_IMPLEMENTATION_COMPLETE.md)
- [Demo README](demo/PDF_DEMO_README.md)
