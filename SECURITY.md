Security and Incident Response

If you discover a secret (API token, PAT, SSH key, etc.) in this repository, follow these steps immediately:

1. Rotate the secret
   - Hugging Face tokens: https://huggingface.co/settings/tokens — revoke the compromised token and create a new one.
   - GitHub PATs: https://github.com/settings/tokens — revoke and re-create if needed.
   - Any cloud provider keys (AWS/GCP/Azure): revoke and re-issue per provider guidance.

2. Invalidate usage
   - Remove the secret from all places it was deployed (CI, runners, servers). Update stored secrets in CI systems.

3. Verify repository cleanup
   - This repository has had its history sanitized for the specific token found. If you suspect other secrets, run a scan and we will purge again.

4. Re-sync for collaborators
   - Because history was rewritten, collaborators should re-clone or reset their local clones:
     - Re-clone: `git clone https://github.com/ranUser01/HunyuanWorld-1.0.git`
     - Or reset existing local clone:
       ```bash
       git fetch origin --prune
       git checkout main
       git reset --hard origin/main
       ```

5. Add files to Git LFS
   - Large model files should be tracked with Git LFS. To add a model file locally and push it via LFS:
     ```bash
     git lfs install
     git lfs track "hy3dworld/utils/weights/*.pth"
     git add .gitattributes
     git add hy3dworld/utils/weights/RealESRGAN_x2plus.pth
     git commit -m "Add model weights via Git LFS"
     git push origin main
     ```

6. Prevent future leaks
   - Install pre-commit hooks with secret scanning and use environment variables for tokens.
   - Never hardcode secrets in repository files. Use CI secret storage for tokens.

If you want, I can help automate scanning and set up pre-commit hooks.
