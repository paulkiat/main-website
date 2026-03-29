# Quick Start Guide - PDF Processing

**Phase 1 Complete** | **Demos Ready** | **Tests Passing**

---

## 🚀 Test the NEW PDF Processor (30 seconds)

### Step 1: Start Server
```bash
# Terminal 1
npm run start
```

### Step 2: Run Demo
```bash
# Terminal 2
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs
```

### Step 3: Verify
```
✓ Upload successful! UID: ABC123
✓ Processing complete

Document: ABC123
  Chunks: 5-10      ← Multiple chunks = SUCCESS! ✅
  State: ready
```

---

## 📝 What Changed

| File | What It Does |
|------|--------------|
| [server/lib/pdf-processor.ts](server/lib/pdf-processor.ts) | Extracts text from PDFs (PDF.js) |
| [server/lib/chunker.ts](server/lib/chunker.ts) | Smart chunking with type detection |
| [server/workplaces/document-api.ts](server/workplaces/document-api.ts) | Integration + feature flag |
| [test/pdf-processor.test.ts](test/pdf-processor.test.ts) | 9 tests (all passing) |
| [demo/pdf-api-demo.mjs](demo/pdf-api-demo.mjs) | WebSocket API testing |

---

## 🎯 Feature Flag

**Enable NEW processor:**
```bash
export USE_NEW_PROCESSOR=true
```

**Disable (use MOCK):**
```bash
unset USE_NEW_PROCESSOR
# or
export USE_NEW_PROCESSOR=false
```

---

## 📊 Expected Results

| Processor | Chunks | Processing | Status |
|-----------|--------|------------|--------|
| **NEW** | 5-10 | <1s | ✅ Working |
| **MOCK** | 1 | 1s | ✅ Default |

---

## 📚 Documentation

- **[PHASE1_COMPLETE.md](PHASE1_COMPLETE.md)** - Full Phase 1 summary
- **[DEMO_IMPLEMENTATION_COMPLETE.md](DEMO_IMPLEMENTATION_COMPLETE.md)** - Demo guide
- **[demo/PDF_DEMO_README.md](demo/PDF_DEMO_README.md)** - Quick reference

---

## 🔧 Commands

```bash
# Run tests
npm test -- test/pdf-processor.test.ts

# Run API demo
USE_NEW_PROCESSOR=true node demo/pdf-api-demo.mjs

# Run browser demo
USE_NEW_PROCESSOR=true node demo/pdf-processing-demo.mjs

# Check git status
git status

# Commit all changes
git commit -F /tmp/commit-message.txt
```

---

## ✅ Success Checklist

- [ ] Server starts successfully
- [ ] Demo connects to WebSocket
- [ ] PDF uploads
- [ ] Processing completes
- [ ] Chunks > 1 (with NEW processor)
- [ ] State = "ready"

---

**Status:** 🎉 Ready for testing & deployment!
