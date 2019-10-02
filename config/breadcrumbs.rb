# 書き方例============================
# ・ :user_index ← 設定ファイルを呼び出し。
# ・ "マイページ" ← パンくずリストに表示される名称。
# ・ mypage_users_path ← 呼び出し元のパス(prefix)。
# ===================================
# ルート
crumb :root do
  link "メルカリ", root_path
end

# ユーザー系===========================
# マイページ(親)
crumb :user_index do
  link "マイページ", users_path
end

#     #ログアウト画面
    crumb :user_logout do
      link "ログアウト", users_logout_path
      parent :user_index
    end

    #ユーザープロフィール編集ページ
    crumb :user_profile do
      link "プロフィール", users_profile_path
      parent :user_index
    end
    # クレジットカード登録画面
    crumb :card_show do
      link "支払い方法", card_show_path
      parent :user_index
    end

    crumb :world do
      link "発送元・お届け先住所変更", world_path
      parent :user_index
    end


    crumb :user_selling do
      link "出品した商品ー出品中", user_status_selling_path
      parent :user_index
    end

    crumb :user_trading do
      link "出品した商品ー取引中", user_status_trading_path
      parent :user_index
    end

    crumb :user_sold do
      link "出品した商品ー売却済み", user_status_sold_path
      parent :user_index
    end

    crumb :email_password do
      link "メール/パスワード", users_email_password_path
      parent :user_index
    end

    crumb :users do
      link "本人情報の登録", users_path
      parent :user_index
    end

    crumb :phone_confirmation do
      link "電話番号の確認", users_phone_confirmation_path
      parent :user_index
    end


# =====================================



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).