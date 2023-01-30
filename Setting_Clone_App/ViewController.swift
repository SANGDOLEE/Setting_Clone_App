import UIKit

class ViewController: UIViewController {
    
    // 섹션에 대한 배열로 생성
    var settingModel = [[SettingModel]]()
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func makeData() {
        settingModel.append (
        [SettingModel(leftImageName: "person.circle", menuTitle: "Sign in to your iphone", subTitle: "Set up iCloud, the App store, and more.", rightImageName: nil)]
        )
        
        settingModel.append (
        [SettingModel(leftImageName: "gear", menuTitle: "General", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "person.fill", menuTitle: "Accessibility", subTitle: nil, rightImageName: "chevron.right"),
        SettingModel(leftImageName: "hand.raised.fill", menuTitle: "Privacy", subTitle: nil, rightImageName: "chevron.right")]
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프로토콜 추가한거에 대한 것
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        
        // Table Veiw에 cell을 스토리보드로 등록하는 것을 코드화 한 것 ( 필수 )
        settingTableView.backgroundColor = UIColor(white: 240/255, alpha: 1)
        settingTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        settingTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(white:240/255, alpha: 1)
        makeData()
    }
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count // 섹션의 개수에 따라
    }
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let myidVC = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            self.present(myidVC, animated: true, completion: nil)
            
        }else if indexPath.section == 1 && indexPath.row == 0 {
            if let generalVC = UIStoryboard(name: "GeneralViewController", bundle: nil).instantiateViewController(identifier: "GeneralViewController") as? GeneralViewController{
                self.navigationController?.pushViewController(generalVC, animated: true)
                
            }
            
        }
    }
    // 어떤 cell을 보여주게 할 것이냐 ( 순서적인 개념 )
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
            as! ProfileCell
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            cell.profileImageView.image=UIImage(systemName: settingModel[indexPath.section][indexPath.row].leftImageName)
            cell.bottomDiscription.text = settingModel[indexPath.section][indexPath.row].subTitle
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.leftImageView.image = UIImage(systemName:settingModel[indexPath.section][indexPath.row].leftImageName)
        cell.leftImageView.tintColor = . red
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        cell.rightImageView.image=UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName ?? "")
        
        return cell
        
    }
    /*
    // cell 의 기본 높이 설정 방법 1 : heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    } // 방법 2 : cell의 imageView에 상,하 간격 설정
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return UITableView.automaticDimension
            
        }
        return 60
    }
}

