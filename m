Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0F4311881
	for <lists+linux-clk@lfdr.de>; Sat,  6 Feb 2021 03:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhBFCjX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Feb 2021 21:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhBFCey (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Feb 2021 21:34:54 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E5CC0698E5
        for <linux-clk@vger.kernel.org>; Fri,  5 Feb 2021 14:26:54 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id w4so8772753ybc.7
        for <linux-clk@vger.kernel.org>; Fri, 05 Feb 2021 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=j8xLJ/gRsabqXmVqApH6UU1AJY7QICocc5XvPOoh2CA=;
        b=E5sFvJO7MoqTQ5HU1iZRDkvKf3YEJnMxgLBzB4Bdzzu+OwTihKotepF9+vecFbKNIx
         RMScWAE2zE8rfvaCnxQasMRx1b2r+VjvXf9v4q+HNHmXZS+zJmKBYlJ1jOnNKPkYLUUx
         +9C9RV4z0aszLyrKr2OQQUAT3XhAqGUElzBIGIsskZIGV69KYaqaW83ucTaO/doqcRq5
         aA1hFJJYjJVvodQlIzs4Yf6qBGi+RWhj71EWMUCnJT+YB8Jg9U54RCqfkCTP8s/4Q2lH
         nfjbItiLvc4Ce0s3du8UwLa5Sd+7cG0N/EYOX2N9Kz9ci0pHOQ3JMNDAeaGfizIIj8Tt
         OyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j8xLJ/gRsabqXmVqApH6UU1AJY7QICocc5XvPOoh2CA=;
        b=mRmr1uaPwzNmg5ZGDSh1TxMNTxYEof1vOf/DiljmQURHCl1KLfZo6aqxAkd5tdGhWI
         0IIb74LszDK5466gKas9kZoQowai9iLiw8uQ0XkVfI4g8VvO9cS5OutmkivAW9UZ6gb2
         iI3Tr8pGaWLnevBPpa3F7/jv7N+Mvwyk9MpmrC4vsEGSgNlnih4YU1z5iuNNEiGCnIDq
         S6AlazePaEvkND+6hUBbcIR942Lgap/RESK78JpxE2J+Y6Mzo23Q14dXS+Y/qqxLfyes
         o8Y8ZguHXTwsvCMVSTOxsHhsZdAuPZoJjqPHOS6YZmUCgPz14gTTcZ96BuXjqxAPjLSD
         ylxw==
X-Gm-Message-State: AOAM5318gAFM6Yh9egpMcndM+/FCu/StMJ7cQBn6CyDr7z5q3NEWCBJP
        1Af+hl+FNa4m8HCyFzcBDUTWTDBlSimyCeo=
X-Google-Smtp-Source: ABdhPJwaxJzPZ4XSeGkT3P5EprKNXkjzOOR8qEj+Bd02rhMYgGuOOcL7rRwb/dvXftOqDNpM24CwbGcGHu5s6VY=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:6d36:b798:55d7:f5c5])
 (user=saravanak job=sendgmr) by 2002:a25:d648:: with SMTP id
 n69mr8876885ybg.462.1612564014028; Fri, 05 Feb 2021 14:26:54 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:26:38 -0800
In-Reply-To: <20210205222644.2357303-1-saravanak@google.com>
Message-Id: <20210205222644.2357303-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210205222644.2357303-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 2/8] of: property: Don't add links to absent suppliers
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If driver core marks a firmware node as not a device, don't add fwnode
links where it's a supplier.

Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6287c6d60bb7..53d163c8d39b 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1103,7 +1103,9 @@ static int of_link_to_phandle(struct device_node *con_np,
 	 * created for them.
 	 */
 	sup_dev = get_dev_from_fwnode(&sup_np->fwnode);
-	if (!sup_dev && of_node_check_flag(sup_np, OF_POPULATED)) {
+	if (!sup_dev &&
+	    (of_node_check_flag(sup_np, OF_POPULATED) ||
+	     sup_np->fwnode.flags & FWNODE_FLAG_NOT_DEVICE)) {
 		pr_debug("Not linking %pOFP to %pOFP - No struct device\n",
 			 con_np, sup_np);
 		of_node_put(sup_np);
-- 
2.30.0.478.g8a0d178c01-goog

