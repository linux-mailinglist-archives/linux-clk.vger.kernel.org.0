Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058A92A1F1C
	for <lists+linux-clk@lfdr.de>; Sun,  1 Nov 2020 16:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgKAPdz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 1 Nov 2020 10:33:55 -0500
Received: from gloria.sntech.de ([185.11.138.130]:47652 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgKAPdz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 1 Nov 2020 10:33:55 -0500
Received: from p57b773f8.dip0.t-ipconnect.de ([87.183.115.248] helo=phil.fritz.box)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1kZFMZ-0003rS-NV; Sun, 01 Nov 2020 16:33:47 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Robin Murphy <robin.murphy@arm.com>, sboyd@kernel.org,
        mturquette@baylibre.com
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        zhangqing@rock-chips.com, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: Add appropriate arch dependencies
Date:   Sun,  1 Nov 2020 16:33:44 +0100
Message-Id: <160424139255.1224767.12169508412175070171.b4-ty@sntech.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <72abb0f794b8ed77e274e8ee21c22e0bd3223dfd.1603710913.git.robin.murphy@arm.com>
References: <72abb0f794b8ed77e274e8ee21c22e0bd3223dfd.1603710913.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 26 Oct 2020 11:17:20 +0000, Robin Murphy wrote:
> There's no point offering support for 32-bit platforms to users
> configuring a 64-bit kernel - and vice-versa - unless they are
> explicitly interested in compile-testing.

Applied, thanks!

[1/1] clk: rockchip: Add appropriate arch dependencies
      commit: 6e0781e092a150b040cc305fd1832730cf78580a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
