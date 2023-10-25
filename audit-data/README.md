You can use the [audit-report-templating](https://github.com/Cyfrin/audit-report-templating) repo to create a minimal PDF audit report, or do something more custom. 

1. Add all your findings to a markdown file like `2023-09-01-password-store-report.md`
   1. Add the metadata you see at the top of that file
   2. Update whenever you see `YOUR_NAME_HERE`
2. Install [pandoc](https://pandoc.org/installing.html) & [LaTeX](https://www.latex-project.org/get/)
3. Download [eisvogel.latex](https://github.com/Cyfrin/audit-report-templating/blob/main/eisvogel.latex) and add to your templates directory (should be `~/.pandoc/templates/`)
4. Add your logo to the directory as a pdf named `logo.pdf`
5. Run this command:
```
pandoc 2023-09-01-password-store-report.md -o report.pdf --from markdown --template=eisvogel --listings
```
