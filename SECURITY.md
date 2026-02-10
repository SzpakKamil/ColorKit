# Security Policy

## Supported Versions

The following versions of ColorKit are currently supported with security updates:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting Issues

### Security Vulnerabilities

I take security issues seriously and appreciate your efforts to responsibly disclose your findings.

If you discover a security vulnerability, please email **dev@kamilszpak.com** with:

1. A clear description of the issue
2. Steps to reproduce the vulnerability
3. The version of ColorKit affected
4. Any potential impacts of the vulnerability
5. If possible, suggestions for fixing the issue

For security vulnerabilities, I request a 90-day disclosure deadline from when you report the issue to allow time to address it properly. I'll acknowledge your report within 48 hours and keep you updated on progress.

### Bugs & Issues

If you encounter any logic errors, layout problems (in SwiftUI bridges), or other bugs, please report them through:

1. GitHub Issues: Create a new issue on the [ColorKit repository](https://github.com/SzpakKamil/ColorKit/issues)
2. Include code snippets or sample colors when possible
3. Note the platform (iOS/macOS/etc.) and version where you encountered the issue
4. List steps to reproduce the bug

### Feature Suggestions

I welcome suggestions for improving ColorKit. To propose new features or enhancements:

1. Use GitHub Issues with the "enhancement" label
2. Clearly describe the proposed functionality
3. Explain the use case and how it would benefit users (e.g., a new color space or blending mode)

## Security Best Practices When Using ColorKit

1. **Keep the package updated** to the latest version.
2. **Sanitize user-provided hex strings** before initializing `CKColor` if using them in security-sensitive contexts.
3. **Be mindful of HDR headroom** when processing colors that might be displayed in sensitive UI areas.

## Commitment to Quality

As the maintainer of ColorKit, I am committed to:

- Promptly addressing security concerns.
- Fixing reported bugs in a timely manner.
- Considering all feature proposals.
- Maintaining transparency about issues.
- Following Apple platform security and design best practices.

## Updates and Notifications

Security updates, bug fixes, and new features will be published as new package versions with clear release notes highlighting the changes.

---

This security policy was last updated on February 10, 2026.
