# Vercel Deployment Checklist ✅

Your app is ready for Vercel! Follow these steps exactly.

## Step 1: Verify GitHub Setup ✅

✅ Your code is on GitHub: https://github.com/jojowilliam707-create/Fraud-Guardian  
✅ Branch: `main`  
✅ All files committed and pushed  

### What's on GitHub:
- ✅ `vercel.json` - Deployment config
- ✅ `.vercelignore` - Files to ignore
- ✅ `package.json` - Dependencies
- ✅ `vite.config.ts` - Build config
- ✅ `src/` - React code
- ✅ `python/` - Flask backend
- ✅ `README.md` - Documentation

## Step 2: Deploy Frontend to Vercel

### Option A: Automatic (Recommended)
1. Go to https://vercel.com
2. Click "New Project" button
3. Select "Import Git Repository"
4. Search for "Fraud-Guardian"
5. Click "Import"
6. **Vercel auto-detects everything** - just click "Deploy"
7. Wait 2-3 minutes for build to complete

### Option B: Manual via CLI
```powershell
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy from project folder
cd "d:\Semester 3\Kecerdasan Buatan\transact-safe-check-main"
vercel --prod
```

## Step 3: Set Environment Variables (CRITICAL!)

After deployment, go to Vercel Dashboard:

1. Select your "Fraud-Guardian" project
2. Go to Settings → Environment Variables
3. Add these variables:

```
VITE_API_URL = https://your-backend-api-url.com
FLASK_ENV = production
FLASK_HOST = 0.0.0.0
```

**Important**: Replace `https://your-backend-api-url.com` with:
- Your Flask backend URL (if deployed separately)
- Or keep `http://localhost:5000` for local backend testing

## Step 4: Backend Deployment (Choose ONE)

Your frontend will be live, but backend needs to run somewhere.

### Option A: Railway (Easy - Recommended)
1. Go to https://railway.app
2. Click "New Project"
3. Select "Deploy from GitHub"
4. Select your "Fraud-Guardian" repo
5. Railway detects Python and deploys automatically
6. Get your backend URL
7. Go back to Vercel and update `VITE_API_URL` env var

### Option B: Render (Also Easy)
1. Go to https://render.com
2. Click "New +"
3. Select "Web Service"
4. Connect GitHub account
5. Select "Fraud-Guardian" repo
6. Set:
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn -b 0.0.0.0:10000 python.App_Flask:app`
7. Deploy and get URL

### Option C: Keep Backend Locally (For Testing)
```powershell
# On your computer
cd "d:\Semester 3\Kecerdasan Buatan\transact-safe-check-main"
python run.py
# Backend runs at http://127.0.0.1:5000
```

Then in Vercel environment variables:
- For local testing: `VITE_API_URL=http://localhost:5000`
- For production: `VITE_API_URL=https://your-backend-url.com`

## Step 5: Verify Deployment

### Check Frontend
1. Open: https://fraud-guardian.vercel.app (or your custom URL)
2. Should see Fraud Guard app loading
3. Check browser console for any errors

### Check API Connection
1. Upload a CSV file or enter transaction details
2. Click "Analyze" button
3. Should get fraud detection result
4. If error, check:
   - Backend is running
   - `VITE_API_URL` is correct in Vercel env vars
   - CORS is enabled in Flask

## Troubleshooting

### Build Fails on Vercel
**Error**: `error during build`

**Solution**:
1. Check Vercel Build Logs: Project → Deployments → Failed Build
2. Common causes:
   - Node version too old
   - Missing environment variables
   - TypeScript errors

**Fix**:
```
Clear Vercel cache: Settings → Advanced → Clear Cache
```

### Frontend Shows But API Fails
**Error**: `Failed to fetch` or CORS error

**Solution**:
1. Verify `VITE_API_URL` env var is set in Vercel
2. Check backend is running
3. Verify CORS is enabled in Flask
4. Check network tab in browser console

### Large Files Error
**Error**: `File exceeds size limit`

**Solution**: This shouldn't happen because:
- `.gitignore` excludes large files
- `.vercelignore` excludes them again
- Re-check `.gitignore` has these lines:
  ```
  model/Creditcard.model
  model/Fraud_CreditCard.csv
  ```

## URLs After Deployment

| Component | URL |
|-----------|-----|
| Frontend | `https://fraud-guardian.vercel.app` |
| Backend (Railway) | `https://your-railway-url.railway.app` |
| Backend (Local) | `http://localhost:5000` |
| GitHub | `https://github.com/jojowilliam707-create/Fraud-Guardian` |

## Quick Reference

### Vercel Environment Variables Needed:
```
VITE_API_URL=<your-backend-url>
FLASK_ENV=production
FLASK_HOST=0.0.0.0
```

### Build Command (Already in vercel.json):
```
npm run build
```

### Output Directory (Already in vercel.json):
```
dist
```

## Final Checklist

- [ ] GitHub repo is public and accessible
- [ ] All files are committed and pushed to `main` branch
- [ ] Vercel project created and linked to GitHub
- [ ] Environment variables set in Vercel dashboard
- [ ] Backend deployed or running locally
- [ ] `VITE_API_URL` points to correct backend
- [ ] Frontend loads at vercel URL
- [ ] API calls work (test by uploading CSV)
- [ ] No console errors in browser

## Success! 🎉

Your Fraud Guardian app is live!

**Share your URL**: `https://fraud-guardian.vercel.app`

---

**Need Help?**
- Vercel Docs: https://vercel.com/docs
- GitHub Issues: https://github.com/jojowilliam707-create/Fraud-Guardian/issues
- Email Support: Available through Vercel dashboard
