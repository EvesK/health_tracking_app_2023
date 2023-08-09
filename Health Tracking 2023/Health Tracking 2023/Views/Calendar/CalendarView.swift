//
//  Calendar.swift
//  Health Tracking 2023
//
//  Created by Evelyn on 8/6/23.
//

// calendar code basis credit: https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec/9169b0293f709bb1f560de2ca8184ea903fd5116

import SwiftUI

fileprivate extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }

    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

fileprivate extension Calendar {
    func generateDates(inside interval: DateInterval, matching components: DateComponents) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)

        enumerateDates(startingAfter: interval.start, matching: components, matchingPolicy: .nextTime) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }

        return dates
    }
}

extension Date {
    var month: Int {
       let cal = Calendar.current
       return cal.dateComponents([.month], from: self).month ?? 0
    }
    
    var day: Int {
       let cal = Calendar.current
       return cal.dateComponents([.day], from: self).day ?? 0
    }
    
    var year: Int {
       let cal = Calendar.current
       return cal.dateComponents([.year], from: self).year ?? 0
    }
    
    var second: Int {
       let cal = Calendar.current
       return cal.dateComponents([.second], from: self).second ?? 0
    }
    
    var minute: Int {
       let cal = Calendar.current
       return cal.dateComponents([.minute], from: self).minute ?? 0
    }
    
    var hour: Int {
       let cal = Calendar.current
       return cal.dateComponents([.hour], from: self).hour ?? 0
    }
    
    var weekday: String {
        return self.formatted(as: "EEEE")
    }
    
    func formatted(as string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = string
        return formatter.string(from: self)
    }
}

struct WeekView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let week: Date
    let content: (Date) -> DateView

    init(week: Date, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.week = week
        self.content = content
    }

    private var days: [Date] {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week) else { return [] }
        return calendar.generateDates(inside: weekInterval, matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }

    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                HStack {
                    if self.calendar.isDate(self.week, equalTo: date, toGranularity: .month) {
                        self.content(date)
                    } else {
                        self.content(date).hidden()
                    }
                }
            }
        }
    }
}

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let month: Date
    let showHeader: Bool
    let content: (Date) -> DateView

    init(month: Date, showHeader: Bool = true, @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.month = month
        self.content = content
        self.showHeader = showHeader
    }

    private var weeks: [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: month) else { return [] }
        return calendar.generateDates(inside: monthInterval, matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }

    private var header: String {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        return formatter.string(from: month)
    }

    var body: some View {
        VStack {
            if showHeader {
                HStack {
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .trailing, endPoint: .leading)
                        )
                        .frame(maxWidth: 110)
                        .frame(height: 4)
                        .frame(minWidth: 10)
                        .cornerRadius(2, corners: [.topRight, .bottomRight])
                        .edgesIgnoringSafeArea(.horizontal)
                    Spacer()
                    Text(header)
                        .font(.custom("OpenSans-SemiBold", size: 20))
                        .layoutPriority(1)
                        .padding(.horizontal, 12)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(maxWidth: 110)
                        .frame(height: 4)
                        .cornerRadius(2, corners: [.topLeft, .bottomLeft])
                        .edgesIgnoringSafeArea(.horizontal)
                }
            }

            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: self.content)
            }
        }
    }
}

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let interval: DateInterval
    let content: (Date) -> DateView

    init(interval: DateInterval, @ViewBuilder content: @escaping (Date) -> DateView) {
        self.interval = interval
        self.content = content
    }

    private var months: [Date] {
        calendar.generateDates(inside: interval, matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(months, id: \.self) { month in
                    MonthView(month: month, content: self.content)
                }
            }
            .padding(.vertical, 16)
        }
    }
}

struct RootView: View {
    @Environment(\.calendar) var calendar
    @State var today: String = Date.now.formatted(as: "MMMM dd YYYY")
    @State var selectedDay: String = Date.now.formatted(as: "MMMM dd YYYY")

    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }

    var body: some View {
        CalendarView(interval: year) { date in
            let dateAsString = date.formatted(as: "MMMM dd YYYY")
            let dayAsString = String(self.calendar.component(.day, from: date))
            
            Button {
                selectedDay = dateAsString
            } label: {
                Text(dayAsString)
                    .font(.custom("OpenSans-SemiBold", size: 20))
                    .foregroundColor(dateAsString == today ? AppColor.white : AppColor.black)
                    .frame(width: 44, height: 44)
                    .overlay {
                        if dateAsString == today && dateAsString == selectedDay {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .top, endPoint: .bottom)
                                    )
                                    .frame(width: 30, height: 30)
                                Circle()
                                    .strokeBorder(LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                                Text(dayAsString)
                                    .font(.custom("OpenSans-SemiBold", size: 20))
                                    .foregroundColor(AppColor.white)
                                    .accessibilityHidden(true)
                            }
                            .frame(width: 44, height: 44)
                            
                        } else if dateAsString == today && dateAsString != selectedDay {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .top, endPoint: .bottom)
                                    )
                                    .frame(width: 44, height: 44)
                                
                                Text(dayAsString)
                                    .font(.custom("OpenSans-SemiBold", size: 20))
                                    .foregroundColor(AppColor.white)
                                    .accessibilityHidden(true)
                            }
                            
                        } else if dateAsString == selectedDay && dateAsString != today {
                            Circle()
                                .strokeBorder(LinearGradient(colors: [AppColor.purple, AppColor.lightblue], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                                .frame(width: 44, height: 44)
                        }

                    }
                    .padding(.vertical, 4)
                    .padding(.horizontal, 0)
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
