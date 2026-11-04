#!/usr/bin/env node

import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import process from 'node:process';
import { fileURLToPath } from 'node:url';
import { execSync } from 'node:child_process';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const packageRoot = path.resolve(__dirname, '..');

const args = process.argv.slice(2);
const isGlobal = args.includes('-g') || args.includes('--global');
const isHelp = args.includes('-h') || args.includes('--help');

console.log('\x1b[36m\x1b[1m');
console.log('   ____                   ____                    ______ _____ __  __ ');
console.log('  / __ \\____  ___  ____  / ___/____  ___  _____  / ____// ____//  |/  / ');
console.log(' / / / / __ \\/ _ \\/ __ \\ \\__ \\/ __ \\/ _ \\/ ___/ / __/  / / __ / /|_/ /  ');
console.log('/ /_/ / /_/ /  __/ / / /___/ / /_/ /  __/ /__  / /___ / /_/ // /  / /   ');
console.log('\\____/ .___/\\___/_/ /_//____/ .___/\\___/\\___/ /_____/ \\____//_/  /_/    ');
console.log('    /_/                    /_/                                          ');
console.log('\x1b[0m');
console.log('\x1b[1mOpenSpec EGM Schema Installer\x1b[0m (Google Elephant-Goldfish Model for OpenSpec)\n');

if (isHelp) {
  console.log('Usage:');
  console.log('  npx openspec-schema-egm          Install schema to current project (openspec/schemas/egm)');
  console.log('  npx openspec-schema-egm -g       Install schema globally for all projects on this machine');
  console.log('  npx openspec-schema-egm --help   Show this help message\n');
  process.exit(0);
}

// Determine target directory
let targetDir;
if (isGlobal) {
  const isWin = process.platform === 'win32';
  const baseDir = isWin
    ? process.env.LOCALAPPDATA || path.join(os.homedir(), 'AppData', 'Local')
    : process.env.XDG_DATA_HOME || path.join(os.homedir(), '.local', 'share');
  targetDir = path.join(baseDir, 'openspec', 'schemas', 'egm');
} else {
  targetDir = path.resolve(process.cwd(), 'openspec', 'schemas', 'egm');
}

console.log(`Target directory: \x1b[36m${targetDir}\x1b[0m`);
fs.mkdirSync(path.join(targetDir, 'templates'), { recursive: true });

// Copy schema.yaml
const schemaSrc = path.join(packageRoot, 'schema.yaml');
fs.copyFileSync(schemaSrc, path.join(targetDir, 'schema.yaml'));

// Copy templates
const templatesSrcDir = path.join(packageRoot, 'templates');
const templateFiles = fs.readdirSync(templatesSrcDir);
for (const file of templateFiles) {
  fs.copyFileSync(path.join(templatesSrcDir, file), path.join(targetDir, 'templates', file));
}

console.log('\x1b[32m✓ Schema and templates successfully installed!\x1b[0m\n');

// Optional openspec validation check
try {
  execSync('openspec schema validate egm', { stdio: 'ignore' });
  console.log('\x1b[32m✓ Verified: OpenSpec CLI successfully recognizes schema "egm"\x1b[0m\n');
} catch {
  // Silent fallback if openspec is not yet in current cwd or path
}

console.log('\x1b[1mQuickstart Usage:\x1b[0m');
console.log('  1. Start a new change using EGM workflow:');
console.log('     \x1b[36mopenspec new change <feature-name> --schema egm\x1b[0m');
console.log('  2. Or set EGM as default schema in \x1b[36mopenspec/config.yaml\x1b[0m:');
console.log('     \x1b[36mschema: egm\x1b[0m\n');
console.log('\x1b[32m\x1b[1mHappy Spec-Driven Engineering! 🚀\x1b[0m\n');
