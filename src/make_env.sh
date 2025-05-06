conda create -n "rimgan" python=3.7.0 ipython
conda activate rimgan
conda install pytorch==1.7.1 torchvision==0.8.2 torchaudio==0.7.2 cudatoolkit=11.0 -c pytorch
conda install click requests tqdm pyspng ninja imageio-ffmpeg==0.4.3
~/anaconda3/envs/rimgan/bin/pip install pyspng
~/anaconda3/envs/rimgan/bin/pip install imageio-ffmpeg==0.4.3
conda install -c conda-forge cudatoolkit-dev -y