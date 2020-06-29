Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC0220E3FB
	for <lists+linux-clk@lfdr.de>; Tue, 30 Jun 2020 00:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgF2VT4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jun 2020 17:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388524AbgF2VSj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Jun 2020 17:18:39 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97BDC061755
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:38 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id u8so8334162qvj.12
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2020 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=Tn7k1LrSf6XKp3W/qTgokaoOKLSCFtf27xTvqer3ndaiwop4QHiDEM23VnFfwUDOgM
         XDAR87wg5GP+0k3okcCl+xyT0NeMeaTl5Bakkw7HjqZPrvCWqnx4dXpJMd3DbXs3wMrw
         W9tkaULO5Q45zP8HPcLC+3Puvov43Zd4IZFd2Cna98Rdsmx/SlAn1zq9pHaMvNXt96Sh
         9FuKfOFhkm6kysPox8IfpCLVdfvKqEQ8diFyFkYAZv0bgXtq979BoYthFq/Cu2EqtQhO
         6SRPn08pDCCaRxdc/tVSeEh0yIbtFQu2+nJlENRauG3jRfDxk6um3Ze8fhVEtiNI4KCj
         T7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=Ej3Gz1W1nsyp4NqWFsfK2l/aDp0eREyNWDsj6Z4briQXL8jQ7Qm5c17W3hoxOyBNxQ
         ziguGMWBWlkuUwx11wM5vrCzBBuP54jghnT7owtrPllLcLB28d2StO6ma8hRY5nEXW2Y
         qz7nPAx7l/o/9SZufKN94XkmxR7s9P22YKn7oybgsQei/tzrjgj+AWaN9xAU/q3mOmeA
         3qHaL9eFmKgM7Q4+QXoAxKt2xR8ZhYeUXQnjuwgmTbiO7x3ZWttmUuEqAFTOmTFvy8iJ
         GjKrj5hvBVv8PEBB/9LWEsGkEVtKcw0OWrX91IMhDUImnedfAIM2zCJGVBYGimNAfmCN
         Vkyg==
X-Gm-Message-State: AOAM532tRrGfHn1sBTzOtvBykDnUevdcKrefcQZna0yHBimnTCxnLL6G
        dWMVfgrFcLGwLyI9hxVgGUbaow==
X-Google-Smtp-Source: ABdhPJxYmnj3766wz3xNh58qo4J2m0WHk33PlfNR2bMI/LND57nvTL+xKqmU8/aYTiLbBPg0aET2PQ==
X-Received: by 2002:ad4:42ad:: with SMTP id e13mr7374289qvr.89.1593465517926;
        Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 02/13] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
Date:   Mon, 29 Jun 2020 17:17:08 -0400
Message-Id: <20200629211725.2592-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.

Fixes: 548a909597d5 ("clk: qcom: clk-alpha-pll: Add support for Trion PLLs")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9b2dfa08acb2..1325139173c9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -56,7 +56,6 @@
 #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
-#define PLL_CAL_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
 
 const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
@@ -115,7 +114,6 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_STATUS] = 0x30,
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
-		[PLL_OFF_CAL_VAL] = 0x44,
 	},
 	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
 		[PLL_OFF_L_VAL] = 0x04,
-- 
2.26.1

