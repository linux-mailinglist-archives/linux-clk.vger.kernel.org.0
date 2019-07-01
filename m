Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70ABE58DC7
	for <lists+linux-clk@lfdr.de>; Fri, 28 Jun 2019 00:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfF0WPd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jun 2019 18:15:33 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:57017 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0WPd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jun 2019 18:15:33 -0400
Received: by mail-pl1-f201.google.com with SMTP id o6so2190760plk.23
        for <linux-clk@vger.kernel.org>; Thu, 27 Jun 2019 15:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Symvyf/Uz9S5oKdNsFmtumlityXOKZm70HtIggCwFnk=;
        b=FUoTSiWGUAtMmT6Erkt4yAeuT0+qjeYcWls6gB3JPv82xDHkgN1hirWiFjVAqnnOVq
         j3Z9Td4BjBrcCMOH4skPnJx3La72XnsWPgIHKbkYMkKrnLi/LFiskUO8f5MhH+PQ6C4e
         KObEoLRcNyNt5RjzC3mElSNiGYJYULWFrsg3bezwh3jABhgWyneK+vjFogRmjHykQlLG
         pWevR8tpcYknyHIgomouTnrqo+1ywloJhMER3s2boTItwF3cssClvvIVSZ0lh6YyFYQq
         9Ik5+4zmwGMCXlH03L6WSLUMi7or2zDUnDFVYXyfNH8gVHiYWki8yp+UMawuPW1mVK8/
         yMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Symvyf/Uz9S5oKdNsFmtumlityXOKZm70HtIggCwFnk=;
        b=n2ZI07CjGrPXHvE7X3WGZPRLhMbY/4lkOv9QZO5jDkX5nddNU5A/D2fjDYa/amytmo
         nm3hqaFg4zM+soQg61aKvdOoHFXnphdo6UpnaEXVks7PNyqwjmN0lDlz1UkyDrfJN9U4
         S0N84l0U0emZzFJokrr4A86U1QQMB7qmUM+f5zC0RyYBFJrhhuahoUv/q8V6zUFshPZm
         i6f5cxjTYW+jwz+6996dbh1FrY2ASc/KF4NGEywdlVAPswqytuCkOdXj4FNkAsLKcadk
         FXl3CwZ9HgbK1rA0fIQEeKG6y6RIzuCFsBj/TD1m9Dl/C7j4GAxOMZvalEsdOGJdGzCA
         MqiQ==
X-Gm-Message-State: APjAAAU2f/UE8RQvCqopBNqnGyu32XQox0hQwwmEcAFQJmOwQomxuv15
        6cg/mCugltyK16Y7nHpyzVdH7T6s4g==
X-Google-Smtp-Source: APXvYqxUVrAymwj/ugIGi6sQXo8Sqq04CVHfX4dFLvmyXHderTB1493KLtyO4xlY6inwpt5jVs2FxtQjAQ==
X-Received: by 2002:a65:6656:: with SMTP id z22mr5733329pgv.197.1561673732735;
 Thu, 27 Jun 2019 15:15:32 -0700 (PDT)
Date:   Thu, 27 Jun 2019 15:15:07 -0700
Message-Id: <20190627221507.83942-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] clk: mediatek: Fix -Wunused-const-variable
From:   Nathan Huckleberry <nhuck@google.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        fparent@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nathan Huckleberry <nhuck@google.com>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Clang produces the following warning

drivers/clk/mediatek/clk-mt8516.c:234:27: warning: unused variable
'ddrphycfg_parents' [-Wunused-const-variable] static const char * const
ddrphycfg_parents[] __initconst = {

This variable has never been used. Deleting it to cleanup the warning.

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/523
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 26fe43cc9ea2..9d4261ecc760 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -231,11 +231,6 @@ static const char * const nfi1x_pad_parents[] __initconst = {
 	"nfi1x_ck"
 };
 
-static const char * const ddrphycfg_parents[] __initconst = {
-	"clk26m_ck",
-	"mainpll_d16"
-};
-
 static const char * const usb_78m_parents[] __initconst = {
 	"clk_null",
 	"clk26m_ck",
-- 
2.22.0.410.gd8fdbe21b5-goog

