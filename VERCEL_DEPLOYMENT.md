# Vercel Deployment Guide - Fraud Guardian

## Prerequisites
- GitHub account with the Fraud-Guardian repository
- Vercel account (https://vercel.com)

## Deployment Steps

### 1. Connect GitHub to Vercel
1. Go to https://vercel.com
2. Sign in with GitHub account
3. Click "Add New..." → "Project"
4. Select your `Fraud-Guardian` repository
5. Click "Import"

### 2. Configure Project Settings
On the Vercel dashboard for your project:

**Root Directory**: Leave empty (default)

**Build Command**: 
```
npm run build
```

**Output Directory**: 
```
dist
```

**Install Command**:
```
npm install
```

### 3. Environment Variables (Critical!)
Add these in Vercel Project Settings → Environment Variables:

| Variable | Value |
|----------|-------|
| `VITE_API_URL` | `https://your-backend-api.com` |
| `FLASK_ENV` | `production` |
| `FLASK_HOST` | `0.0.0.0` |

**Important**: The `VITE_API_URL` must point to your backend API server (Flask). You can:
- Use a separate Vercel deployment for backend
- Point to external Flask server
- Use Railway/Render for Python backend

### 4. Deploy
1. Click "Deploy"
2. Wait for build to complete
3. Your app will be live at: `https://your-project-name.vercel.app`

## Important Notes

### Frontend Only
- This Vercel deployment handles **only the React frontend**
- The Flask backend must run separately

### Backend Deployment Options

#### Option A: Separate Vercel Deployment (Python)
```bash
# Create a separate Python project for backend
# Use Vercel Python runtime
```

#### Option B: Railway/Render (Recommended for Python)
1. Go to https://railway.app or https://render.com
2. Deploy the Python backend
3. Set `VITE_API_URL` to your backend URL

#### Option C: Keep Running Locally
- Deploy frontend to Vercel
- Keep Flask running on local machine
- Set `VITE_API_URL=http://localhost:5000` for development

### Model File Issue
The `Creditcard.model` and `Fraud_CreditCard.csv` files are in `.gitignore` because they're too large.

**If you need them on Vercel:**
1. Upload model to cloud storage (AWS S3, Google Cloud Storage)
2. Download during API initialization
3. Update `App_Flask.py` to fetch from cloud

## Troubleshooting

### Build Fails
```
Error: Build failed
```
- Check Node version: `node --version` (should be 18+)
- Clear Vercel cache: Project Settings → Advanced → Clear Cache

### API Requests Fail
- Verify `VITE_API_URL` environment variable is set
- Check CORS is enabled in Flask backend
- Ensure backend server is running/accessible

### Large Files Error
- This is expected - model files are in `.gitignore`
- Deployment should still succeed (frontend only)

## After Deployment

### Push Changes
```powershell
git add .
git commit -m "Add Vercel deployment configuration"
git push origin main
```

Vercel will automatically redeploy when you push to main branch!

### Monitor Deployment
- Vercel Dashboard shows deployment status
- Check logs in "Deployments" tab
- Production URL shown in deployment details

## Next Steps

1. **Deploy Backend Separately**
   - Choose Railway/Render/Heroku
   - Deploy Flask app
   - Update `VITE_API_URL`

2. **Setup Custom Domain** (Optional)
   - Vercel → Domains
   - Add your custom domain

3. **Setup CI/CD** (Automatic)
   - Every push to `main` triggers deployment
   - Rollback to previous deployment if needed

## Project URLs After Deployment

- **Frontend**: `https://fraud-guardian.vercel.app`
- **Backend**: Set your own backend URL in env vars
- **GitHub**: `https://github.com/jojowilliam707-create/Fraud-Guardian`

## Support

- Vercel Docs: https://vercel.com/docs
- Flask Deployment: https://flask.palletsprojects.com/deployment/
- Contact: Issues on GitHub

---

Happy deploying! 🚀
