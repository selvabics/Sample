//
//  FilmViewController.swift
//  M
//
//  Created by Selvamurugan on 18/05/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let contentArr: [String] = ["Bahubali, directed by SS Rajamouli, is a big, sweeping epic that runs for close to 2 hours and 40 minutes. Spanning generations, going back and forth between the present and the past, alternating between vastly contrasting landscapes, it's an ambitious work from a visionary filmmaker who skillfully blends a tale of old school palace politics with modern VFX to deliver a consistently watchable blockbuster.", "Smuggled out of the kingdom of Mahishmati as a baby and raised by tribals in a village located at the foot of a waterfall, Shiva (Telugu star Prabhas) is the Bahubali of the film's title, a human with god-like strength and valor. After repeated attempts to scale the mountains and climb up to the top of the waterfall, Shiva finally achieves his goal, only to encounter Avanthika (Tamannah), a female warrior and member of a rebel group.", "Their frankly silly romantic track - in which he distracts her with a snake while tattooing her shoulder, or undresses her systematically while giving her a makeover - is the weakest link in the film, stretching out an already overlong first half. Avanthika leads Shiva to his destiny beyond the walls of Mahishmati, where despotic king Bhallal Dev (Rana Dagubatti) is installing a 50-foot gold statue of himself.", "Rajamouli gives us a terrific interval point, and the film moves briskly in its second half, when it goes into flashback mode to reveal a familiar story of family conflict within the royal household, and Shiva's true identity. The piece de resistance of the film is a roughly 30-minute war sequence achieved through a combination of special effects and thrilling in-camera shots. You're riveted by the action, and by the drama that unfolds on the battlefield, leading to an explosive finale. Prabhas and Rana, each flexing his tree trunk-sized biceps, puts up a great show.", "Save for a few unconvincing bits, including an escape from an oncoming avalanche that looks completely fake, the VFX in Bahubali are more sophisticated than what we've seen in most Indian films. Art director Sabu Cyril employs them niftily to give depth and scale to his magnificent sets, and cinematographer KK Senthil Kumar gives us beautiful vistas combining the real and the computer-generated more-or-less seamlessly.", "But the film's secret sauce is Rajamouli's expert handling of the simple but dependable screenplay, his ability to whip up rousing moments, and his skill at mining emotions from even clichéd scenarios. He is aided by an impressive cast who're at the top of their game, including Ramya Krishna as just queen Sivagami, and Sathyaraj as Katappa, loyal senapati of Mahishmati. Rana Dagubatti has a strong presence, and invokes fear by simply bulging those eyes. Prabhas lets his hulking physicality do the bulk of work for him, but brings much by way of performance through his sheer intensity.", "From the tropical landscapes of Avatar and the bloody battles of The Lord of The Rings films, to the images from the Mahabharata and the Ramayana that it evokes, Rajamouli's film hat-tips to its various influences without ever stealing from any. I was surprised by how much I enjoyed Bahubali given that I watched a Hindi dubbed version of the original Telugu film. Rajamouli is indeed a visual storyteller, and he brings the curtains down on this first part of his two-film saga with a curious cliffhanger. I can't wait for Part 2, which comes next year.", "I'm going with four out of five for Bahubali. It's exactly what a blockbuster should be. Hugely entertaining, without ever being dumb."]
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    
    let headerHeight: CGFloat = 250
    let headerCut: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set estimated height for table
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        updateView()
        
    }
    
    func updateView() {
        
        tableView.backgroundColor = UIColor.white
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.addSubview(headerView)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = newHeaderLayer
        
        let newHeight = headerHeight - headerCut/2
        self.tableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        self.tableView.contentOffset = CGPoint(x: 0, y: -newHeight)
        
        setHeaderView()
    }
    
    func setHeaderView() {
        let newHeight = headerHeight - headerCut/2
        var headerFrame: CGRect = CGRect(x: 0, y: -newHeight, width: tableView.bounds.width, height: headerHeight)
        if tableView.contentOffset.y < newHeight {
            headerFrame.origin.y = tableView.contentOffset.y
            headerFrame.size.height = -tableView.contentOffset.y + headerCut/2
        }
        headerView.frame = headerFrame
        
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: headerFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: headerFrame.width, y: headerFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: headerFrame.height - headerCut))
        newHeaderLayer.path = cutDirection.cgPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Film ViewController is Deallocated")
    }
    
    // MARK: ScrollView Delegate Methods
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setHeaderView()
    }
    
    // MARK: Action Methods
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContentCell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.descriptionLabel.text = "      " + contentArr[indexPath.row]
        return cell
    }

}
