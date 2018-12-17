//
//  MultiDelegateTableView.swift
//  Multidelegate
//
//  Created by Alex Kisel on 6/25/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

open class MultidelegateTableView: UITableView {
  public var multiDelegate = MulticastDelegate<UITableViewDelegate>()
  
  override open func awakeFromNib() {
    super.awakeFromNib()
    delegate = self
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    delegate = self
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    delegate = self
  }
}

extension MultidelegateTableView: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
  }
  
  public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
  }
  
  public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
  }
  
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:heightForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, heightForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, heightForRowAt: indexPath) ?? tableView.rowHeight
  }
  
  public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:heightForHeaderInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, heightForHeaderInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, heightForHeaderInSection: section) ?? 0
  }
  
  public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:heightForFooterInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, heightForFooterInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, heightForFooterInSection: section) ?? 0
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:estimatedHeightForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, estimatedHeightForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? tableView.estimatedRowHeight
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:estimatedHeightForHeaderInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, estimatedHeightForHeaderInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, estimatedHeightForHeaderInSection: section) ?? tableView.estimatedSectionHeaderHeight
  }
  
  public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:estimatedHeightForFooterInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, estimatedHeightForFooterInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, estimatedHeightForFooterInSection: section) ?? tableView.estimatedSectionFooterHeight
  }
  
  public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:viewForHeaderInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, viewForHeaderInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, viewForHeaderInSection: section)
  }
  
  public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:viewForFooterInSection:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, viewForFooterInSection: section)
      }
    }
    return targetDelegate?.tableView?(tableView, viewForFooterInSection: section)
  }
  
  public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, accessoryButtonTappedForRowWith: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:shouldHighlightRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, shouldHighlightRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, shouldHighlightRowAt: indexPath) ?? true
  }
  
  public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didHighlightRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didUnhighlightRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:willSelectRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, willSelectRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, willSelectRowAt: indexPath) ?? indexPath
  }
  
  public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:willDeselectRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, willDeselectRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, willDeselectRowAt: indexPath) ?? indexPath
  }
  
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didSelectRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didDeselectRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:editingStyleForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, editingStyleForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, editingStyleForRowAt: indexPath) ?? .none
  }
  
  public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:titleForDeleteConfirmationButtonForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: indexPath)
  }
  
  public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:editActionsForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, editActionsForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, editActionsForRowAt: indexPath)
  }
  
  @available(iOS 11.0, *)
  public func tableView(_ tableView: UITableView,
                 leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:leadingSwipeActionsConfigurationForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, leadingSwipeActionsConfigurationForRowAt: indexPath)
  }
  
  @available(iOS 11.0, *)
  public func tableView(_ tableView: UITableView,
                 trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:trailingSwipeActionsConfigurationForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, trailingSwipeActionsConfigurationForRowAt: indexPath)
  }
  
  public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:shouldIndentWhileEditingRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, shouldIndentWhileEditingRowAt: indexPath) ?? true
  }
  
  public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, willBeginEditingRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didEndEditingRowAt: indexPath)
    }
  }
  
  public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
                 toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath,
                                toProposedIndexPath: proposedDestinationIndexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath,
                                      toProposedIndexPath: proposedDestinationIndexPath) ?? proposedDestinationIndexPath
  }
  
  public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:indentationLevelForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, indentationLevelForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, indentationLevelForRowAt: indexPath) ?? 0
  }
  
  public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:shouldShowMenuForRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, shouldShowMenuForRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, shouldShowMenuForRowAt: indexPath) ?? false
  }
  
  public func tableView(_ tableView: UITableView, canPerformAction action: Selector,
                 forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:canPerformAction:forRowAt:withSender:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender)
      }
    }
    return targetDelegate?.tableView?(tableView, canPerformAction: action, forRowAt: indexPath, withSender: sender) ?? false
  }
  
  public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, performAction: action, forRowAt: indexPath, withSender: sender)
    }
  }
  
  public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:canFocusRowAt:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, canFocusRowAt: indexPath)
      }
    }
    return targetDelegate?.tableView?(tableView, canFocusRowAt: indexPath) ?? false
  }
  
  public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:shouldUpdateFocusIn:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, shouldUpdateFocusIn: context)
      }
    }
    return targetDelegate?.tableView?(tableView, shouldUpdateFocusIn: context) ?? false
  }
  
  public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    multiDelegate.invoke { delegate in
      delegate.tableView?(tableView, didUpdateFocusIn: context, with: coordinator)
    }
  }
  
  public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(indexPathForPreferredFocusedView(in:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.indexPathForPreferredFocusedView?(in: tableView)
      }
    }
    return targetDelegate?.indexPathForPreferredFocusedView?(in: tableView)
  }
  
  @available(iOS 11.0, *)
  public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath,
                 with context: UISpringLoadedInteractionContext) -> Bool {
    var targetDelegate: UITableViewDelegate?
    multiDelegate.invoke { delegate in
      if (delegate as? MulticastableDelegate)?.responsibleForSelectors()?
        .contains(#selector(tableView(_:shouldSpringLoadRowAt:with:)).description) ?? false {
        targetDelegate = delegate
      } else {
        _ = delegate.tableView?(tableView, shouldSpringLoadRowAt: indexPath, with: context)
      }
    }
    return targetDelegate?.tableView?(tableView, shouldSpringLoadRowAt: indexPath, with: context) ?? false
  }
}
