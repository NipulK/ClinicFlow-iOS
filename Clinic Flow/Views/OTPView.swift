import SwiftUI

struct OTPView: View {
    let phoneNumber: String

    @State private var otpCode: String = ""
    @State private var secondsRemaining: Int = 165 // 02:45
    @State private var timer: Timer? = nil
    @Environment(\.dismiss) private var dismiss

    private let navyColor = Color(red: 0.13, green: 0.27, blue: 0.40)

    var formattedTime: String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Verify Phone Number")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.primary)

                    Text("Enter the verification code sent to your phone")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(.top, 32)
                .padding(.bottom, 28)

                // Code Sent To Card
                HStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(red: 0.82, green: 0.90, blue: 0.95))
                            .frame(width: 52, height: 52)
                        Image(systemName: "iphone")
                            .font(.system(size: 22))
                            .foregroundColor(navyColor)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("CODE SENT TO")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.secondary)
                            .tracking(0.5)
                        Text(phoneNumber)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(14)
                .padding(.bottom, 28)

                // Verification Code Field
                VStack(alignment: .leading, spacing: 8) {
                    Text("VERIFICATION CODE")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.primary)
                        .tracking(0.5)

                    TextField("Enter 6-digit code", text: $otpCode)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .keyboardType(.numberPad)
                        .onChange(of: otpCode) { _, newValue in
                            if newValue.count > 6 {
                                otpCode = String(newValue.prefix(6))
                            }
                        }

                    HStack {
                        Text("Code expires in \(formattedTime)")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)

                        Spacer()

                        Button("Resend Code") {
                            secondsRemaining = 165
                            startTimer()
                        }
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(navyColor)
                    }
                    .padding(.top, 4)
                }
                .padding(.bottom, 28)

                // Verify & Continue Button
                Button {
                    // Handle OTP verification
                } label: {
                    Text("Verify & Continue")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(navyColor)
                        .cornerRadius(14)
                }
                .padding(.bottom, 24)

                // OR Divider
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(.systemGray4))
                    Text("OR")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 12)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color(.systemGray4))
                }
                .padding(.bottom, 24)

                // Sign in Using Patient ID Button
                Button {
                    // Handle Patient ID sign in
                } label: {
                    Text("Sign in Using Patient ID")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color.white)
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color(.systemGray4), lineWidth: 1)
                        )
                }
                .padding(.bottom, 32)

                // Footer Links
                VStack(spacing: 16) {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .foregroundColor(.secondary)
                        Button("Sign Up") {
                            // Handle sign up
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(navyColor)
                    }
                    .font(.system(size: 15))

                    HStack(spacing: 4) {
                        Text("Need assistance?")
                            .foregroundColor(.secondary)
                        Button("Contact reception") {
                            // Handle contact
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(navyColor)
                    }
                    .font(.system(size: 15))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
        }
        .navigationTitle("Verify OTP")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(navyColor)
                }
            }
        }
        .onAppear { startTimer() }
        .onDisappear { timer?.invalidate() }
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                timer?.invalidate()
            }
        }
    }
}

#Preview {
    NavigationStack {
        OTPView(phoneNumber: "+1 (555) 123-4567")
    }
}
