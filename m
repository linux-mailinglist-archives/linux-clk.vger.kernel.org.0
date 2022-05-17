Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF4A52AB9A
	for <lists+linux-clk@lfdr.de>; Tue, 17 May 2022 21:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352515AbiEQTJz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 May 2022 15:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiEQTJx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 15:09:53 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70C9B1E1
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:09:51 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id pq9-20020a17090b3d8900b001df622bf81dso3118141pjb.3
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 12:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WX9lP7cN1XhMLxAyp1fuinpNzyHjtW9iix4zXAbknMw=;
        b=Z8ufLbQ+4mZKJyLdDDFC62aZ5/hDqWVFsdPEZUe33bzH3AdGyPj61awGDS5cNbbHDg
         W0naIEoFAgkHlY99tWGdn5v6aLiFChtOCWg8sJMnXMl7EZ0442nl51aORC6xH7dmy/JF
         XiGHxnjy8cCUW0mftFfTsk9zgCOzTxU4pzhd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WX9lP7cN1XhMLxAyp1fuinpNzyHjtW9iix4zXAbknMw=;
        b=t9zDlES6KP9bOgrtTvKtv35FsmlRfKb6N+JsPJQX3CkQQ8yEo3Zw39sRXq78v9jvdq
         UCewHxYQrf1YBwASHXge2cyHfMn4i60v+cj3vdsNdFFmgM7BmTK/O5/df3siP3Xxx6vm
         W+bZ/TCLgzkaJaHZInfPzxNjs6iz7R0ZjvyLYipngYpcDdkIc4aQLQDsz7gQDMnZoNcl
         4baCPfRbNHLdzK75HApB6kWhUOCuIwDsUrCr6vU6Zrx8s4C/Y9P9oY6NwWYsAtLLVU7C
         SLgZYjFBvOEC3lnXyCzFedcTUn82BNY5SccpEgUGwDjLjzQC1+hOHbBNKlk0QMF+kaS/
         GIzw==
X-Gm-Message-State: AOAM532TdOvHh8e+wHvJdVsnTvHkQOjLlBDptEIz3pVrMgoNc0aEhHMq
        QgRoWaihGrto2aj/J7/BM9T8Sg==
X-Google-Smtp-Source: ABdhPJx+Bj9KO0Av1JRLZUrA6agVbkgI6FASmev7Quni+bS7dw7sIuv6+UWHsrp4bEZdBmdbt5QrIA==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id l17-20020a170903121100b0015e82088cc0mr23524064plh.52.1652814591197;
        Tue, 17 May 2022 12:09:51 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:be81:6c26:5643:b3d9])
        by smtp.gmail.com with ESMTPSA id f16-20020a170902ab9000b0015e8d4eb246sm9498265plr.144.2022.05.17.12.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 12:09:50 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
Date:   Tue, 17 May 2022 12:09:49 -0700
Message-Id: <20220517190949.2922197-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sleep/wake state doesn't need to be set here because of specific
RPMh behavior that carries over the active state when sleep/wake state
hasn't been modified. Add a note to the code so we aren't tempted to set
the sleep/wake states.

Cc: Alex Elder <elder@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

This superseedes a previous patch[1] I sent that tried to fix this.

 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index aed907982344..c07cab6905cb 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -274,6 +274,11 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 		cmd.addr = c->res_addr;
 		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
 
+		/*
+		 * Send only an active only state request. RPMh continues to
+		 * use the active state when we're in sleep/wake state as long
+		 * as the sleep/wake state has never been set.
+		 */
 		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
 		if (ret) {
 			dev_err(c->dev, "set active state of %s failed: (%d)\n",

base-commit: 42226c989789d8da4af1de0c31070c96726d990c
-- 
https://chromeos.dev
[1] https://lore.kernel.org/r/20220412194505.614002-1-swboyd@chromium.org
