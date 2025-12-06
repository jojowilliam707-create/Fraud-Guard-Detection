# Quick Deployment Checklist

## ✅ Before You Start
- [ ] You have GitHub account with Fraud-Guard-Detection repo
- [ ] All code is pushed to GitHub (run `git push` to verify)
- [ ] Credit.pickle model file is in `/model` folder

## ✅ Step 1: Deploy Backend (Railway)
- [ ] Go to https://railway.app
- [ ] Sign in with GitHub
- [ ] Click "New Project" → "Deploy from GitHub repo"
- [ ] Select "Fraud-Guard-Detection"
- [ ] Wait 2-3 minutes for deployment
- [ ] Go to "Settings" → Copy your Railway domain
- [ ] Example: `https://fraud-guard-api-production.up.railway.app`
- [ ] Test it: Open domain + `/api/health` in browser
  - Should see: `{"status":"healthy","model_loaded":true}`

**Your Backend URL:** `_________________________________`

## ✅ Step 2: Deploy Frontend (Vercel)
- [ ] Go to https://vercel.com
- [ ] Sign in with GitHub
- [ ] Click "Add New" → "Project"
- [ ] Search and select "Fraud-Guard-Detection"
- [ ] **Before clicking Deploy**, scroll down to "Environment Variables"
- [ ] Add variable:
  - Name: `VITE_API_URL`
  - Value: `<your Railway URL from above>`
  - Example: `https://fraud-guard-api-production.up.railway.app`
- [ ] Click "Deploy"
- [ ] Wait 2-5 minutes
- [ ] Copy your Vercel URL (shown after deployment completes)

**Your Frontend URL:** `_________________________________`

## ✅ Step 3: Test Everything
- [ ] Open your Vercel URL in browser
- [ ] You should see Fraud Guard app (purple theme)
- [ ] Try uploading a CSV file with transactions
- [ ] Click "Predict" button
- [ ] You should see fraud prediction results
- [ ] ✅ No "Failed to Fetch" error = Success!

## ✅ If Still Getting "Failed to Fetch"

### Check 1: Verify Backend URL
- [ ] Open Railway URL + `/api/health` in browser
- [ ] Should return JSON, not error page

### Check 2: Verify Vercel Environment Variable
- [ ] Go to Vercel → Settings → Environment Variables
- [ ] Check that `VITE_API_URL` is exactly correct
- [ ] Go to Deployments → Redeploy the latest version

### Check 3: Check for errors in console
- [ ] Open Vercel URL
- [ ] Press F12 (open Developer Tools)
- [ ] Click "Console" tab
- [ ] Look for red error messages
- [ ] Take a screenshot and share the error

### Check 4: Verify model file exists
- [ ] Open Railway → Your Project → Logs tab
- [ ] Search for "Found model file: Credit.pickle"
- [ ] If not found, model loading failed
- [ ] Contact support with the error message

## 🎉 Success!

When everything works:
- Vercel shows your Fraud Guard app
- Upload CSV or enter transaction data
- Get fraud prediction results
- Share your Vercel URL with others - they can use it too!

### Share Your App
Your Vercel URL is now a public link anyone can access:
```
https://fraud-guard-detection.vercel.app
```

---

## Environment Variables Reference

### In Vercel Dashboard → Settings → Environment Variables
```
VITE_API_URL = https://fraud-guard-api-production.up.railway.app
```

### In Railway Dashboard → Variables
```
FLASK_ENV = production
FLASK_HOST = 0.0.0.0
FLASK_PORT = 5000
```

