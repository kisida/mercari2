# 書き方例============================
# ・ :user_index ← 設定ファイルを呼び出し。
# ・ "マイページ" ← パンくずリストに表示される名称。
# ・ mypage_users_path ← 呼び出し元のパス(prefix)。
# ===================================
# ルート
crumb :root do
  link "メルカリ", root_path
end

# ユーザー系＝＝＝＝＝＝＝＝＝＝＝＝＝＝
# マイページ(親)
crumb :user_index do
  link "マイページ", users_path
end
    # 本人情報の登録
    crumb :user_edit do
      link "本人情報の登録", users_edit_path
      parent :user_index
    end

    #ログアウト画面
    crumb :user_logout do
      link "ログアウト", users_logout_path
      parent :user_index
    end

    #ユーザープロフィール編集ページ
    crumb :user_show do
      link "プロフィール", users_show_path
      parent :user_index
    end

    crumb :user_credit_new do
      link "支払い方法", credit_new_users_path
      parent :user_index
    end









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