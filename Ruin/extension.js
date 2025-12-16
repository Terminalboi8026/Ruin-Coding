const vscode = require('vscode');

function activate(context) {
  console.log('Ruin language extension activated');
  // no runtime registrations required for TextMate grammar-only extension
}

function deactivate() {
}

module.exports = { activate, deactivate };
