Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A72DE99CAA
	for <lists+linux-clk@lfdr.de>; Thu, 22 Aug 2019 19:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391643AbfHVRgF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Aug 2019 13:36:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38820 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391722AbfHVRY4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 13:24:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id e11so4046671pga.5
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/DBFL5pnFxmW7r8pfJ654oUFkPKTYmOJJb8EXbuSt0=;
        b=RX3L3NEysLNGueK8XYcm4tI5nQZ2pEFyeSxHYiObmFt8nWRtF62qzckIHmf2rpGxrP
         BLn4KXyVPFgfoviJQgPO/s2j82QZFQl96pFgqGNU4z2fsVsaxfgeFqyUhckvdrHLzqrA
         p8HLWOVvrNzJ8jujwhikFfgqm0RNuFfV4wK1Xj4qfo6pDRR2KeGAgorfqhi1U2Q1agzD
         qLOLhFMM0fBHGwattVPoacW0SA8gg+UqkAchcyWJxEspzojX5olDwPFZWk9xUAaO6LPb
         8Qp3+xNgeubaXFd3rIDxjUGNumFk054qag4X+vH9xDBisRUZi4LK940Ny0tqYab7R/zY
         5V+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/DBFL5pnFxmW7r8pfJ654oUFkPKTYmOJJb8EXbuSt0=;
        b=Ie3CZJCJ891tbyDppwjGXKj4NbuHekg1Vb1OCjhayC+YBI95PcnSBL/irQHvK7teJC
         T8cR7gzwTRNGyWZffjw6pUQy8npS5WJlmnPGI88BFD7FQpw1mBFoeLUy7dLRyEfjm9Mo
         qM2H3/TiDhaGuQGudEntk8ua1lYuQlCpFZW3rOCRzaXbKyW/kfimnbO75mvOGfJ5jfGt
         TFqSQZqqlDadSyhWAnNiu5NW7rVLuTcpw1g8DJgmtfoQFZax30+UOMh80fRTfpdW/Qhy
         4WaP5BQfR1lEfV4wfLrGbV/3hrahLpq+owpcw/saHW9xTBD95gCIQnV39n+U86Kn6U8X
         8zeQ==
X-Gm-Message-State: APjAAAV7YS/V2bwXnohjm/tGffY0kB5eODToW59rYW6E0Pu4UJRKv/gN
        rolD9YqJBkNqME8s5UNn9W9P
X-Google-Smtp-Source: APXvYqxXFDaJ955RJz/a34+rWtNfFOs3hBYdX2U9Etyi7MVotAVqBYvnVOl+UsQc16TjNDKQSF4Dkw==
X-Received: by 2002:a63:e20a:: with SMTP id q10mr327282pgh.24.1566494695791;
        Thu, 22 Aug 2019 10:24:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:71cc:5738:24ad:193e:4b59:8a76])
        by smtp.gmail.com with ESMTPSA id r12sm31705798pgb.73.2019.08.22.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 10:24:55 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/8] clk: Warn if clk_init_data is not zero initialized
Date:   Thu, 22 Aug 2019 22:54:20 +0530
Message-Id: <20190822172426.25879-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The new implementation for determining parent map uses multiple ways
to pass parent info. The order in which it gets processed depends on
the first available member. Hence, it is necessary to zero init the
clk_init_data struct so that the expected member gets processed correctly.
So, add a warning if multiple clk_init_data members are available during
clk registration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..7d6d6984c979 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3497,6 +3497,14 @@ static int clk_core_populate_parent_map(struct clk_core *core)
 	if (!num_parents)
 		return 0;
 
+	/*
+	 * Check for non-zero initialized clk_init_data struct. This is
+	 * required because, we only require one of the (parent_names/
+	 * parent_data/parent_hws) to be set at a time. Otherwise, the
+	 * current code would use first available member.
+	 */
+	WARN_ON((parent_names && parent_data) || (parent_names && parent_hws));
+
 	/*
 	 * Avoid unnecessary string look-ups of clk_core's possible parents by
 	 * having a cache of names/clk_hw pointers to clk_core pointers.
-- 
2.17.1

