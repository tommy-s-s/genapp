module UsersHelper

    def period(date_in)
        d1 = date_in
        d2 = Date.today
        d2 -= d1 - Date.new( d1.year, d1.month, 1 )
        # 月数で計算
        diff_months = d2.year * 12 + d2.month - d1.year * 12 - d1.month
        # 年月日に戻す
        diff_years = diff_months / 12
        diff_months -= diff_years * 12
        diff_days = d2.day - 1 
        return "#{diff_years}年#{diff_months}ヶ月#{diff_days}日"
    end
end
