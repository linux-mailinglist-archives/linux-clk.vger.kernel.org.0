Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EA91D6CC4
	for <lists+linux-clk@lfdr.de>; Sun, 17 May 2020 22:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEQUPJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 17 May 2020 16:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgEQUPE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 May 2020 16:15:04 -0400
Subject: Re: [GIT PULL] clk fixes for v5.7-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589746504;
        bh=D9VWro2YKBZnYUUXAmM6NCvOWmY4Q+wzO0aHKhwhFkw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=FW8Cb3ZCDnSr/O65PmW9cze6KEATMtJ7WSPnTbH6jWzbHpjsLrpKwrJMJc4dlEmv9
         r+cLwvcUa+u7sX1nMgXscXeJQ3j1kxs9NRBCcQAoyEEglLjRscz5DvZnTuOET5Zob6
         sSMYY9XSCMJoX1VRrBeoxWSm84Sh7NUMXI4nSaW8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200517174834.126920-1-sboyd@kernel.org>
References: <20200517174834.126920-1-sboyd@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200517174834.126920-1-sboyd@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
 tags/clk-fixes-for-linus
X-PR-Tracked-Commit-Id: 852049594b9af58fa2972103699fd58a7ac165c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b1f2cbdb6d3062c468d3f9b579501f0f7ce330b
Message-Id: <158974650408.31612.8511040806300170549.pr-tracker-bot@kernel.org>
Date:   Sun, 17 May 2020 20:15:04 +0000
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pull request you sent on Sun, 17 May 2020 10:48:34 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b1f2cbdb6d3062c468d3f9b579501f0f7ce330b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
