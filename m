Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC162C7C96
	for <lists+linux-clk@lfdr.de>; Mon, 30 Nov 2020 02:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgK3Bwt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 29 Nov 2020 20:52:49 -0500
Received: from gloria.sntech.de ([185.11.138.130]:40852 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727185AbgK3Bwt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Nov 2020 20:52:49 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kjYMF-0007OY-AD; Mon, 30 Nov 2020 02:52:03 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Xu Wang <vulab@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
        mturquette@baylibre.com, linux-rockchip@lists.infradead.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Remove redundant null check before clk_prepare_enable
Date:   Mon, 30 Nov 2020 02:51:59 +0100
Message-Id: <160670107988.1055391.13206262718686759521.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127090551.50254-1-vulab@iscas.ac.cn>
References: <20201127090551.50254-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 27 Nov 2020 09:05:51 +0000, Xu Wang wrote:
> Because clk_prepare_enable() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.

Applied, thanks!

[1/1] clk: rockchip: Remove redundant null check before clk_prepare_enable
      commit: 7f5b57a095f3b9532793d143655e83433bb448af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
