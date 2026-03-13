import SwiftUI

struct ProfileView: View {
    private let navy = Color(red: 0.13, green: 0.27, blue: 0.40)
    private let lightBlue = Color(red: 0.88, green: 0.93, blue: 0.97)

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                headerView

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        patientCard

                        sectionTitle("QUICK ACTIONS")
                        VStack(spacing: 10) {
                            quickActionRow(icon: "creditcard", iconTint: .blue, title: "Payment Methods")
                            quickActionRow(icon: "bag", iconTint: .orange, title: "Billing History")
                            quickActionRow(icon: "exclamationmark.circle", iconTint: Color(.systemGray), title: "Help & Support")
                            quickActionRow(icon: "accessibility", iconTint: Color(.systemGray), title: "Accessibility Settings")
                        }

                        sectionTitle("QUICK ACTIONS")
                        VStack(spacing: 10) {
                            quickActionRow(icon: "exclamationmark.circle", iconTint: Color(.systemGray), title: "Help & Support")
                            quickActionRow(icon: "accessibility", iconTint: Color(.systemGray), title: "Accessibility Settings")
                        }

                        sectionTitle("SETTINGS")
                        settingsCard

                        Text("Version 1.0.0")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 4)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 14)
                    .padding(.bottom, 110)
                }
            }

            VStack {
                Spacer()
                logoutButton
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    var headerView: some View {
        HStack {
            Button(action: {}) {
                HStack(spacing: 5) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                    Text("Back")
                        .font(.system(size: 19, weight: .semibold))
                }
                .foregroundColor(navy)
            }

            Spacer()

            Text("Profile")
                .font(.system(size: 33, weight: .bold))

            Spacer()

            Button(action: {}) {
                Text("Edit")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(navy)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .fill(Color(.separator).opacity(0.3))
                .frame(height: 1),
            alignment: .bottom
        )
    }

    var patientCard: some View {
        VStack(spacing: 14) {
            HStack(spacing: 14) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(navy)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Text("JP")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                    )

                VStack(alignment: .leading, spacing: 3) {
                    Text("John Patient")
                        .font(.system(size: 34, weight: .bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                    Text("Patient ID: #12345")
                        .font(.system(size: 22))
                        .foregroundColor(.secondary)
                }

                Spacer()
            }

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("VISIT ID")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                        .tracking(0.6)
                    Text("V-2024-0206")
                        .font(.system(size: 30, weight: .bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }

                Spacer()

                VStack(alignment: .leading, spacing: 4) {
                    Text("CHECK-IN TIME")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.secondary)
                        .tracking(0.6)
                    Text("9:30 AM")
                        .font(.system(size: 30, weight: .bold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.04), radius: 4, y: 2)
    }

    func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(Color(red: 0.43, green: 0.52, blue: 0.65))
            .tracking(1.0)
    }

    func quickActionRow(icon: String, iconTint: Color, title: String) -> some View {
        Button(action: {}) {
            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: icon)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(iconTint)
                    )

                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemGray3))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 14)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray5), lineWidth: 1)
            )
        }
    }

    var settingsCard: some View {
        VStack(spacing: 0) {
            settingsRow("Notifications")
            Divider().padding(.leading, 16)
            settingsRow("Language & Region")
            Divider().padding(.leading, 16)
            settingsRow("Privacy & Security")
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }

    func settingsRow(_ title: String) -> some View {
        Button(action: {}) {
            HStack {
                Text(title)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.primary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(.systemGray3))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }
    }

    var logoutButton: some View {
        Button(action: {}) {
            Text("End Visit & Logout")
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0.76, green: 0.82, blue: 0.89), lineWidth: 2)
                )
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 10)
        .background(
            Color(.systemBackground)
                .shadow(color: .black.opacity(0.05), radius: 8, y: -4)
        )
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
