Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2225E676E
	for <lists+linux-clk@lfdr.de>; Thu, 22 Sep 2022 17:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbiIVPo7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Sep 2022 11:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbiIVPo2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 11:44:28 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41942EEB60
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 08:44:07 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so2790732pjk.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6FFf9oDO3u21l4Neb7zGO6dVIW2Jkoj56oT34Mb8mL0=;
        b=Cy0Dotm4XbAkwQwiGs+SH9HMbIEIyDSART/n0VHSj7cf56vHo5MbfjT0VgaYXYjKw8
         0yZkHoKBtGQX9t/sR4DomzMOAMvDp9kW2NCMmAc/ydiVUuHVOMiylqc98TYlDuF84zqQ
         nJaSkDKDVtuf1k8Z9EdtOaHiYjvfEpFe/R92M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6FFf9oDO3u21l4Neb7zGO6dVIW2Jkoj56oT34Mb8mL0=;
        b=b3V4nh7hvhS7ob5yQ2yS2JjCQnyx0wI5NirOuZ5BImBUDQMCFl5NTMdq+r3NzcT1JX
         pLANOrFkUjXnh2HS7COyGxyiYyHc9raW046aXGJxvj5eQhgY2ZW0cWqw+XiWrWSFo5c1
         y8I4Y6wuL6ooPCHkFlPloovdN8e2O4FMBrt1Euet/IFH2U3VH9lSI7R3Goc0OaWl23cR
         EO2MGAMrZRylfkJ1q5jofCieuTdFtf2VLLUa6N4/J8n5km8v/G+aNLT1gCpwpVJOcdQ6
         xkiDh7JFGNHYC51VjSLFGA2OZDvCymAn9ygaIfORcoDUGBVVnqkk5ekrGsjEbtL33QUL
         T+hw==
X-Gm-Message-State: ACrzQf0aNz56Jy2SXFC4EVzvcxzcNe5xHPxNa5qhITPjAjfLtdsZ4ONT
        t4lDwxldLGGQB43TCCtC05MjEw==
X-Google-Smtp-Source: AMsMyM4knj5jTFu87gPkiDznVYWgYDZ98L4ozx/zs6zac8qeUpXQx6al+DD7rUKWgLZenvR9DE4zUw==
X-Received: by 2002:a17:902:a411:b0:178:9e4c:2ef8 with SMTP id p17-20020a170902a41100b001789e4c2ef8mr3835730plq.95.1663861446673;
        Thu, 22 Sep 2022 08:44:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5321:6ad9:3932:13d8])
        by smtp.gmail.com with ESMTPSA id a19-20020a621a13000000b0053e8fe8a705sm4685492pfa.17.2022.09.22.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 08:44:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     rafael@kernel.org, sboyd@kernel.org
Cc:     pavel@ucw.cz, linux-pm@vger.kernel.org, len.brown@intel.com,
        linux-clk@vger.kernel.org, gregkh@linuxfoundation.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] PM: runtime: Add pm_runtime_try_put_sync() and pm_runtime_try_get_sync()
Date:   Thu, 22 Sep 2022 08:43:53 -0700
Message-Id: <20220922084322.RFC.1.Iaa18b24fef0c8e88f0b82502f7fa0a70565b64d2@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220922154354.2486595-1-dianders@chromium.org>
References: <20220922154354.2486595-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In some cases, a caller may wish to synchronously get or put the PM
Runtime state of a device but the caller may also be holding a
resource that the runtime suspend or runtime resume of the device
needs. Obviously this can lead to deadlock.

A case in point is the clock framework. While running
clk_disable_unused() the clock framework holds the global clock
"prepare" lock. The clock framework then goes through and does PM
Runtime actions. It should be no surprise to anyone that some devices
need to prepare or unprepare clocks are part of their PM Runtime
actions. Things generally work OK because of the "recursive" nature of
the global clock "prepare" lock, but if we get unlucky and the PM
Runtime action is happening in another task then we can end up
deadlocking.

Let's add a "try" version of the synchronous PM Runtime routines.
This version will return -EINPROGRESS rather than waiting. To
implement this we'll add a new flag: RPM_TRY.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/base/power/runtime.c |  7 +++++--
 include/linux/pm_runtime.h   | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 997be3ac20a7..67cc6a620b12 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -609,7 +609,7 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	if (dev->power.runtime_status == RPM_SUSPENDING) {
 		DEFINE_WAIT(wait);
 
-		if (rpmflags & (RPM_ASYNC | RPM_NOWAIT)) {
+		if (rpmflags & (RPM_ASYNC | RPM_NOWAIT | RPM_TRY)) {
 			retval = -EINPROGRESS;
 			goto out;
 		}
@@ -791,7 +791,10 @@ static int rpm_resume(struct device *dev, int rpmflags)
 	    || dev->power.runtime_status == RPM_SUSPENDING) {
 		DEFINE_WAIT(wait);
 
-		if (rpmflags & (RPM_ASYNC | RPM_NOWAIT)) {
+		if (rpmflags & RPM_TRY) {
+			retval = -EINPROGRESS;
+			goto out;
+		} else if (rpmflags & (RPM_ASYNC | RPM_NOWAIT)) {
 			if (dev->power.runtime_status == RPM_SUSPENDING)
 				dev->power.deferred_resume = true;
 			else
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 0a41b2dcccad..c68baa63f0e7 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -21,6 +21,8 @@
 #define RPM_GET_PUT		0x04	/* Increment/decrement the
 					    usage_count */
 #define RPM_AUTO		0x08	/* Use autosuspend_delay */
+#define RPM_TRY			0x10	/* Try to be synchronous but fail
+					    with an error if we can't. */
 
 /*
  * Use this for defining a set of PM operations to be used in all situations
@@ -425,6 +427,19 @@ static inline int pm_runtime_get_sync(struct device *dev)
 	return __pm_runtime_resume(dev, RPM_GET_PUT);
 }
 
+/**
+ * pm_runtime_try_get_sync - Like pm_runtime_get_sync() but err if blocking
+ * @dev: Target device.
+ *
+ * This function works just like pm_runtime_get_sync() except that if the
+ * device in question is currently in the process of suspending or resuming
+ * that it will return with -EINPROGRESS instead of blocking.
+ */
+static inline int pm_runtime_try_get_sync(struct device *dev)
+{
+	return __pm_runtime_resume(dev, RPM_GET_PUT | RPM_TRY);
+}
+
 /**
  * pm_runtime_resume_and_get - Bump up usage counter of a device and resume it.
  * @dev: Target device.
@@ -489,6 +504,19 @@ static inline int pm_runtime_put_sync(struct device *dev)
 	return __pm_runtime_idle(dev, RPM_GET_PUT);
 }
 
+/**
+ * pm_runtime_try_put_sync - Like pm_runtime_put_sync() but err if blocking
+ * @dev: Target device.
+ *
+ * This function works just like pm_runtime_put_sync() except that if the
+ * device in question is currently in the process of suspending that it will
+ * return with -EINPROGRESS instead of blocking.
+ */
+static inline int pm_runtime_try_put_sync(struct device *dev)
+{
+	return __pm_runtime_idle(dev, RPM_GET_PUT | RPM_TRY);
+}
+
 /**
  * pm_runtime_put_sync_suspend - Drop device usage counter and suspend if 0.
  * @dev: Target device.
-- 
2.37.3.968.ga6b4b080e4-goog

