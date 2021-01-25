Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9830830287E
	for <lists+linux-clk@lfdr.de>; Mon, 25 Jan 2021 18:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbhAYRKK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 25 Jan 2021 12:10:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728836AbhAYRJ2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 12:09:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D142C06178A
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 09:08:45 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80890331;
        Mon, 25 Jan 2021 18:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1611594522;
        bh=8VVLCzEL/PaM7XAmAK6bOQStNzGgz6J2oVeBgoWZwsM=;
        h=From:To:Cc:Subject:Date:From;
        b=XDyMwtgK7XicS7tXju77TNM4aeI8Sam+wE09bG8SxRGaUWKQmBUHUsc9kXxwWQ7cA
         z9EsDzmzkUQrkr9+9pehNDGtomCB9qq1yrbSvcV/DEuEjK5M0GtU0eb+P/4zK1YEwe
         tMVvpI+Mt1Y+SbeRN5ooPj6Q1gW8NkJz5YWTOl6I=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Phi-Bang Nguyen <pnguyen@baylibre.com>,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] clk: mediatek: Fix mux clock re-parenting
Date:   Mon, 25 Jan 2021 19:08:17 +0200
Message-Id: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This small patch series fixes re-parenting of the mux clocks on MediaTek
platforms. Patch 1/2 is a drive-by cleanup that removes unneeded code
(as I didn't want to update that code in the next patch), while patch
2/2 fixes the problem. Please see invidual patches for details.

The code has been tested with the CAMTG2 and CAMTG3 clocks on MT8183.
Quite interestingly some parents can be selected without this fix (I can
for instance select a parent that has a lower frequency), but not all of
them. I'm not sure if all mux clocks are affected, but as far as I can
tell the fix shouldn't introduce regressions.

Laurent Pinchart (2):
  clk: mediatek: mux: Drop unused clock ops
  clk: mediatek: mux: Update parent at enable time

 drivers/clk/mediatek/clk-mux.c | 93 ++++++++++++----------------------
 drivers/clk/mediatek/clk-mux.h | 14 ++---
 2 files changed, 34 insertions(+), 73 deletions(-)

-- 
Regards,

Laurent Pinchart

