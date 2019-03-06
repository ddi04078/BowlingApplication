//
//  TableViewController.swift
//  LineChartExample
//
//  Created by 양지연 on 2019. 3. 6..
//  Copyright © 2019년 Osian. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var scores = ["A","B","C","D","E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //섹션의 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //배열의 count(수)를 리턴할 수 있는 프로퍼티를 리턴한다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }

    //인자로 테이블뷰와 index path 가 주어지면 UITableViewCell(cell : 테이블의 하나의 셀)을 리턴
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //인자로 받은 tableView의 프로퍼티인 dequeueReusableCell : 테이블 뷰를 스크롤하면, 동일한 셀이 사용되지만 데이터소스를 기반으로 셀 내용이 바뀌게 됨.
        //identifier로 reuseIdentifier를 가지는, 셀을 cell이라는 변수에 넣어줌 -> 이후에 꼭 스토리보드의 cell의 identifier를 reuseIdentifier로 명시해준다!!
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        //identifier가 reuseIdentifier인 cell의 textLable의 text에 arr[indexPath.row]를 대입
        //indexPath : [section, row]로 이루어진 행을 식별하는 상대적인 경로
        //indexPath를 출력하면 [0,0], [0,1], [0,2], [0,3]...이 나온다 : 0번째 섹션 / 셀의 수 row
        cell.textLabel?.text = scores[indexPath.row]
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // 데이터 삭제
            scores.remove(at: indexPath.row)
            // Data source로 부터 row 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
