Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A6D1ED984
	for <lists+linux-clk@lfdr.de>; Thu,  4 Jun 2020 01:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgFCXeN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 3 Jun 2020 19:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgFCXcP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 19:32:15 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE3AC08C5C6
        for <linux-clk@vger.kernel.org>; Wed,  3 Jun 2020 16:32:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 64so2485423pfg.8
        for <linux-clk@vger.kernel.org>; Wed, 03 Jun 2020 16:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mP7HDY2ZN5ivM9lomEi6uc16BWfE9HMAWk/tyOctczk=;
        b=VUpMlsS8luWYC3XyHHaZc+nRVPBUhMgVRgY7r6ereTmxJ2CV63CmoY9G8LrGOkuSTQ
         K47uNjixFZ1fYU9L0oHIXbtPGyL3X2bOpWgIhpXRvnlBLqW0qd3WjT492H4d1foUpJxP
         H25ReL/ps5emEFx5QusYD9+rH0F1unUcjPs5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mP7HDY2ZN5ivM9lomEi6uc16BWfE9HMAWk/tyOctczk=;
        b=Nq8BcX/Vp8A0wQNJUeKulkq3fnssjGL2FJZXrn2RTAUVKUnL2eSexyVn6+e2fyQ6qw
         x2FcS+tMICUHOYHOy30gZjxl7DWKtefaM6xtyvFPTa4Wlm7ySn7zyu8HmSXuOVZVnOkr
         e2692wHrPiZVnmyebyWTdopHBk0UrWeNwnFZPBOzBO2nv7kswUqod5dJeRZiTepI3fv3
         IV1diJt8DT9DX4nOoIXNAlHuqORx5ylKUs2nlO/KLdC93PGbaDqPZ/e/lWg9QpGx597v
         ykVJ9WFfLTyEAsOD8OC1O2R8ByEaMhgoDRQGTkl834ZCv3+tibyrVtSoqzq3EVRdCYYn
         MMMw==
X-Gm-Message-State: AOAM533JStVd3cSN+fLN2hn/aDWkh8puhzlJ7K+PT7GWlX4RcrBa8CgL
        VKl8igBLRV4O8aAwf/pbxLFm/Q==
X-Google-Smtp-Source: ABdhPJx7JrP50eeA2KfLnLeonR3ATTZL4fgn8xfVLKyPbfOSa9aQRBoHTRs7znIl54UHsuA1YKgyUQ==
X-Received: by 2002:a63:6541:: with SMTP id z62mr1735576pgb.320.1591227133920;
        Wed, 03 Jun 2020 16:32:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x77sm2799667pfc.4.2020.06.03.16.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 16:32:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>, x86@kernel.org,
        drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
        b43-dev@lists.infradead.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-mm@kvack.org, clang-built-linux@googlegroups.com
Subject: [PATCH 04/10] rtlwifi: rtl8192cu: Remove uninitialized_var() usage
Date:   Wed,  3 Jun 2020 16:31:57 -0700
Message-Id: <20200603233203.1695403-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603233203.1695403-1-keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just initialize this variable to NULL,
and avoid sending garbage by returning.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
index f070f25bb735..5b071b70bc08 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
@@ -592,7 +592,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
 						    bool wmm_enable,
 						    u8 queue_sel)
 {
-	u16 uninitialized_var(value);
+	u16 value;
 
 	switch (queue_sel) {
 	case TX_SELE_HQ:
@@ -606,7 +606,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
 		break;
 	default:
 		WARN_ON(1); /* Shall not reach here! */
-		break;
+		return;
 	}
 	_rtl92c_init_chipn_reg_priority(hw, value, value, value, value,
 					value, value);
-- 
2.25.1

