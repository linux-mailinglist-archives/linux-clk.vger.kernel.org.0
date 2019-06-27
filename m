Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DCD58D96
	for <lists+linux-clk@lfdr.de>; Fri, 28 Jun 2019 00:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF0WGu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jun 2019 18:06:50 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:53611 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbfF0WGu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 18:06:50 -0400
Received: by mail-pg1-f202.google.com with SMTP id w22so2002663pgc.20
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2019 15:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=iOIuT1w8SKhqU0tOLmAe3kv4MDfWt/x8OJo6YX/y9oc=;
        b=jSDkNA5LQH+FSb/Qia4R2KWHwPty4yHuIwp6TJEEqqLl1T/gXBFnKMEi9LxoaWJHZQ
         hH+hOrQqD7UnMmr3mWtGH49tjIW16QGlONkTFjiQtqKyEZaPLDcUcZ+htsFAUCqCO48K
         zGHef5GViOZGayMfOhTwZs+NLQgMHai+TYSVybcPcbVxXFX1UbEiO22y4eQPV/GlxQUk
         gzdH2QAw2DoxRDrmf5YUa/qHP6bOaqEIKMQUrUAY+a+WmT+kAm+P0JZJEb7Elb13rN1v
         6xr2884AZ6xA/T4W+TYMeYPLdT5gx69GJohtrUjGVT9jmCD2TlmcE4LQFq9rrDdi3ozi
         mEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=iOIuT1w8SKhqU0tOLmAe3kv4MDfWt/x8OJo6YX/y9oc=;
        b=ZOX7pg3oKrmWKFhYuGQZsYTLohAKg3Gur8J+P+2NZK2c0UiC8Lc86ZOGztWSW/dPsQ
         CHmo38p9VK0+F7TfKDmU0L9A3e97BWvTbkvAi4i41GgS1M2cWLGsLZmaa4wZabNXTchk
         IQ0n/c0gnnpStWW4+WF6mubiL8U74ocYsOOT6KQRQ6rJmk4+k/AfwX41NxukbL7kBcaL
         qU6fiFPnZ2/hQVpSCmGdhGtLvHqYGMJqAfQb4APsr87/JW7ujbwG9WMuTcFQcf6IAX5C
         6BbzBg2tytFLXF4QjfC1ykyCVSwDXK56TozxXO7P7YOaiTefUY56QzqDhqAHNtjkIJLV
         gL6g==
X-Gm-Message-State: APjAAAVMEegyqnDlQy3C17P58QHelFt5f1szpTbLxtoKAv9ScMrIfVZh
        HmasyweYIZtVam+ZUBIOd1rh9o9yvQ==
X-Google-Smtp-Source: APXvYqw0vM2adqB+1ViXyVQ+eZ77pfsjezHBzZi9i6+3YHTu/RBpst5O7BkRfwtHoSrYiz3lcajuOqBxrA==
X-Received: by 2002:a63:6986:: with SMTP id e128mr6240631pgc.220.1561673209121;
 Thu, 27 Jun 2019 15:06:49 -0700 (PDT)
Date:   Thu, 27 Jun 2019 15:06:42 -0700
Message-Id: <20190627220642.78575-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] clk: qoriq: Fix -Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        yogeshnarayan.gaur@nxp.com, oss@buserror.net
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

drivers/clk/clk-qoriq.c:138:38: warning: unused variable
'p5020_cmux_grp1' [-Wunused-const-variable] static const struct
clockgen_muxinfo p5020_cmux_grp1

drivers/clk/clk-qoriq.c:146:38: warning: unused variable
'p5020_cmux_grp2' [-Wunused-const-variable] static const struct
clockgen_muxinfo p5020_cmux_grp2

In the definition of the p5020 chip, the p2041 chip's info was used
instead.  The p5020 and p2041 chips have different info. This is most
likely a typo.

Link: https://github.com/ClangBuiltLinux/linux/issues/525
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/clk/clk-qoriq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 4739a47ec8bd..0f8870527940 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -678,7 +678,7 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.guts_compat = "fsl,qoriq-device-config-1.0",
 		.init_periph = p5020_init_periph,
 		.cmux_groups = {
-			&p2041_cmux_grp1, &p2041_cmux_grp2
+			&p5020_cmux_grp1, &p5020_cmux_grp2
 		},
 		.cmux_to_group = {
 			0, 1, -1
-- 
2.22.0.410.gd8fdbe21b5-goog

