Return-Path: <linux-clk+bounces-11876-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB947972906
	for <lists+linux-clk@lfdr.de>; Tue, 10 Sep 2024 07:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74CAF1F24ED7
	for <lists+linux-clk@lfdr.de>; Tue, 10 Sep 2024 05:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9AA14C581;
	Tue, 10 Sep 2024 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZEin5f9q"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753EDBA42;
	Tue, 10 Sep 2024 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947629; cv=none; b=BQRSLgLPXWoQTPWqtSvVwSItlaM40+4uDRMb8pguduJYnQxMQevxIZdXNSi8xGGbkQ4wyPMSvOS6fvy//ABrGEScSiRTqEBid4XCNlPrcW2JwK1+nofVFtzmOoJi2iTdXI6DfeWL+a3pIKT32sIuWu3OzCCUnO8I2G+lQrapqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947629; c=relaxed/simple;
	bh=uvUT2li9t6kQrgl7EAisZODqTq1+vnL8VvIBaN8rxvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GBOo0QorfK2yeZqK4/cX8UcAKfKcfAsC0U6piyGvQYCrmNbO7XliPZ+rszQBiqjxfk/ajUuAYfTEWs0PzmIUkW91JZ/IL/oxFzit96+ikMDJFRPSZLV5aWk3L2JMsGXTPXKHggKSGqxQPgOLYOB0uHeVol7OOdxr7xpR+jho9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZEin5f9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9F1CC4CEC3;
	Tue, 10 Sep 2024 05:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725947629;
	bh=uvUT2li9t6kQrgl7EAisZODqTq1+vnL8VvIBaN8rxvA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZEin5f9qdhlcx+McditaTMcWtfE9Zml5qB6LRe5vnkwOVW0zApcnJNleP/RAMck+k
	 kcTs/FiX7mCaJxqEwJghiwWmeTq1nJP+yl/dh+r6bTQGJAUIr3MguJdJsk2jQpyzMw
	 hK9gjkizJzPusJ3qpQscEb4+sskmRJpl7KTgl7oFN7y+kMzkNuEasN/Kn5SLdiW/62
	 gP8NuONJLPFKhJg0h+UUuXo/iOmciLzg5/1rdOBmbfmoy+27nSKh6obNe9m99xJHlJ
	 gr9YXpfvKWJRpu2/huD9wGjlr5cFZVNuAoaSHom1EYY2eM1J0G6mgomZlF4J6IPLas
	 FhpqzdDsZDGdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83B2ECE582;
	Tue, 10 Sep 2024 05:53:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 10 Sep 2024 13:53:44 +0800
Subject: [PATCH] clk: Fix invalid execution of clk_set_rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix_clk-v1-1-111443baaeaa@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAOfe32YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0MD3bTMivjknGxdc8Ok5BQjg6QUY+M0JaDqgqJUoBTYpOjY2loA901
 2lVkAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725947627; l=1619;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=3tAKqELYhIvRcXnUoRlXXLtvnJsBHNdrLYPkwEE/zJI=;
 b=MFbnaaVvkM7y7cG1rTenn+RlC/vW4QvIC4DEqGeAHtl2HMKuRduRtutjrLqkpcqhY9gey+F/U
 sIwGXwnw06jCuqfqCuVdTeyVvBQZwriPntFkUiKwZrH2I11yHy6aOz6
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Some clocks have rates that can be changed elsewhere, so add a flag
CLK_GET_RATE_NOCACHE(such as scmi_clk) to these clocks to ensure that
the real-time rate is obtained.

When clk_set_rate is called, it is returned if the request to set rate
is consistent with the current rate. Getting the current rate in
clk_set_rate returns the rate stored in clk_core. CLK_GET_RATE_NOCACHE
does not take effect here.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Some clocks have rates that can be changed elsewhere, so add a flag
CLK_GET_RATE_NOCACHE(such as scmi_clk) to these clocks to ensure that
the real-time rate is obtained.

When clk_set_rate is called, it is returned if the request to set rate
is consistent with the current rate. Getting the current rate in
clk_set_rate returns the rate stored in clk_core. CLK_GET_RATE_NOCACHE
does not take effect here.
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 285ed1ad8a37..79b453b82528 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2536,7 +2536,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	rate = clk_core_req_round_rate_nolock(core, req_rate);
 
 	/* bail early if nothing to do */
-	if (rate == clk_core_get_rate_nolock(core))
+	if (rate == clk_core_get_rate_recalc(core))
 		return 0;
 
 	/* fail on a direct rate set of a protected provider */

---
base-commit: 2cd6543d82b9dc7b971b9b64f22ad34a1cae3076
change-id: 20240910-fix_clk-71bcd20bd33f

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



