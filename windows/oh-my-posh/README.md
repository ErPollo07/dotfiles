# Oh my posh

## Create the style file

To use oh my posh you need a style file like catppuccin_mocha.omp.json.
Put it in any folder you like and proceed on the next step.

## Select the style file

To make this file as the active configuration open a powershell window and type:

```bash
notepad $profile
```

In the files that opens write this line:

```txt
oh-my-posh init pwsh --config "C:\path\to\file.omp.json" | Invoke-Expression
```

Then save the file and open the powershell again.
