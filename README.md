# Getting Started with Git and the UniWebEnrollment Repository

This guide will walk you through installing Git, cloning the UniWebEnrollment repository, and setting up your environment to start working.

## Step 1: Install Git

### On Windows:
1. **Download Git:**
   - Visit the official Git website: [https://git-scm.com/](https://git-scm.com/).
   - Click on the "Download for Windows" bbuttons

2. **Run the Installer:**
   - Open the downloaded `.exe` file.
   - Follow the installation wizard:
     - Accept the license agreement.
     - Choose the default components (recommended).
     - Select "Git from the command line and also from 3rd-party software" when prompted.
     - Use the default options for the remaining steps.

3. **Verify Installation:**
   - Open Command Prompt or PowerShell.
   - Run the command:
     ```bash
     git --version
     ```
   - If Git is installed correctly, you'll see the version number.

### On Linux:
1. **Install Git:**
   - Open a terminal.
   - Run the following command based on your distribution:

     - **Debian/Ubuntu:**
       ```bash
       sudo apt update
       sudo apt install git
       ```

2. **Verify Installation:**
   - Run the command:
     ```bash
     git --version
     ```
   - If Git is installed correctly, you'll see the version number.

## Step 2: Clone the UniWebEnrollment Repository

1. **Navigate to Your Desired Directory:**
   - Open a terminal (Linux) or Command Prompt/PowerShell (Windows).
   - Use the `cd` command to navigate to the directory where you want to clone the repository. For example:
     ```bash
     cd ~/Documents
     ```

2. **Clone the Repository:**
   - Run the following command to clone the UniWebEnrollment repository:
     ```bash
     git clone https://github.com/kinseyboze/UniWebEnrollment.git
     ```

3. **Navigate into the Repository:**
   - Use the `cd` command to move into the cloned repository:
     ```bash
     cd UniWebEnrollment
     ```

## Step 3: Set Up Your Environment

1. **Create a New Branch:**
   - Before making changes, create a new branch to work on:
     ```bash
     git checkout -b your-branch-name
     ```
   - Replace `your-branch-name` with a descriptive name for your branch (e.g., `feature/add-login`).

2. **Make Changes:**
   - Open the repository in your preferred code editor (e.g., VS Code, Sublime Text).
   - Make the necessary changes to the code.

3. **Stage and Commit Changes:**
   - Stage your changes:
     ```bash
     git add .
     ```
   - Commit your changes with a descriptive message:
     ```bash
     git commit -m "Your commit message here"
     ```

4. **Push Changes to Remote:**
   - Push your branch to the remote repository:
     ```bash
     git push origin your-branch-name
     ```

5. **Create a Pull Request (Optional):**
   - If you're working in a team, go to the repository on GitHub and create a pull request for your branch.

## Step 4: Keep Your Repository Updated

1. **Fetch and Merge Changes:**
   - Before starting work, ensure your local repository is up to date:
     ```bash
     git checkout main
     git pull origin main
     ```

2. **Merge Your Branch (Optional):**
   - If you're working on a feature branch, merge it onto the latest main branch:
     ```bash
     git checkout your-branch-name
     git merge main
     ```

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)

---

## Setting Up SSH for GitHub (For Contributors)

### For **Windows** Users:

1. **Generate a new SSH key**:
   - Open **Git Bash** (you can install it from [here](https://git-scm.com/)).
   - Run the following command to generate a new SSH key:
     ```bash
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
     ```
     - When prompted to "Enter file in which to save the key", press `Enter` to accept the default location (`/c/Users/your-username/.ssh/id_rsa`).
     - You can choose to set a passphrase or leave it empty (press `Enter`).

2. **Copy the SSH public key**:
   - Run the following command to display your SSH public key:
     ```bash
     cat ~/.ssh/id_rsa.pub
     ```
     - Copy the output of this command.

3. **Add the SSH key to GitHub**:
   - Go to **GitHub > Settings > SSH and GPG keys**.
   - Click **New SSH key**, give it a title (e.g., "Windows Laptop SSH Key"), and paste your SSH key into the key field.

4. **Change your repository's remote URL to SSH**:
   - Open your project in Git Bash, then run:
     ```bash
     git remote set-url origin git@github.com:kinseyboze/UniWebEnrollment.git
     ```
   - Verify the change by running:
     ```bash
     git remote -v
     ```
     The URL should now start with `git@github.com:kinseyboze/UniWebEnrollment.git`.

### For **Linux** Users:

1. **Generate a new SSH key**:
   - Open a terminal and run the following command to generate a new SSH key:
     ```bash
     ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
     ```
     - When prompted to "Enter file in which to save the key", press `Enter` to accept the default location (`~/.ssh/id_rsa`).
     - You can choose to set a passphrase or leave it empty (press `Enter`).

2. **Copy the SSH public key**:
   - Run the following command to display your SSH public key:
     ```bash
     cat ~/.ssh/id_rsa.pub
     ```
     - Copy the output of this command.

3. **Add the SSH key to GitHub**:
   - Go to **GitHub > Settings > SSH and GPG keys**.
   - Click **New SSH key**, give it a title (e.g., "Linux Desktop SSH Key"), and paste your SSH key into the key field.

4. **Change your repository's remote URL to SSH**:
   - In your project directory, run the following command to change the remote URL to SSH:
     ```bash
     git remote set-url origin git@github.com:kinseyboze/UniWebEnrollment.git
     ```
   - Verify the change by running:
     ```bash
     git remote -v
     ```
     The URL should now start with `git@github.com:kinseyboze/UniWebEnrollment.git`.
