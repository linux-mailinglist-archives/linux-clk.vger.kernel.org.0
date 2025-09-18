Return-Path: <linux-clk+bounces-27846-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC9EB57F32
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 16:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B3E93ACE04
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C655931D75C;
	Mon, 15 Sep 2025 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MckR8/fO"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACB1F4CB3;
	Mon, 15 Sep 2025 14:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757947010; cv=none; b=hpFmI6jsKQUSD37iqGSKtu3WgiE1yxYJKFRk1sf4SGRpIKWJBbzccpObFXzBwswmZrAGLdg6E/udHkt4fOuiuU25zcOPv/H2MSjD9WD8aVODc/qwgGUi91vShm/IFeMnWj6kFqke2y+g0vCicYl6/kL2He/XjwH1WGOJI1gTKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757947010; c=relaxed/simple;
	bh=lWTfUooKBHxRj0AEjDVG4lEODpzAtqXZGx+VDKCy+8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jipzqlEMw35J6Qrl/PcCaeUWwC36zwBXE/DOniueNdF4e30LMfSd3XEB1yKe9P08gPEfd4H+6IjV83td4WZXkN0saH6DYHZhNH1emZBSXZYP7UdHJ66nOCJPfKAJC0U9Q9QXw65xeM4n7ZCxbBWyH8RiIbFm8MABIXJnQpbNqgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MckR8/fO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8D1C4CEFD;
	Mon, 15 Sep 2025 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947010;
	bh=lWTfUooKBHxRj0AEjDVG4lEODpzAtqXZGx+VDKCy+8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MckR8/fOICHyGpMdP7LtuXaD9m96cYfzcCmQsxryAMOPioHH0m/K+3yQ8mU0Pd/ig
	 u26n1AVBuug4htyBalPeF3YWVnwgZV1VtjUrAAZFsIJiWvSV+ZJwzx3mq0+6FRES1N
	 S5DSqI0G+tYS5cZccM0cQ2uHVv/0iXf0oH8RnEF6aFtM0q4UCtfYnv4n5Zw4WOxONQ
	 t//FFt2K3nF5lsck2ooxnXpIJ8Y6fdVoudj63DA48htOMMPRabWeWV0ioyOgKfIBmu
	 H5OiBEmpi+hHa6ZurLsNoIswEOtghhG2TQXIavS6+CIbWl0IS5vVR1OabIakSTuXHL
	 EK7CVWrF2PKYw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific compatible
Date: Mon, 15 Sep 2025 16:34:38 +0200
Message-Id: <20250915143440.2362812-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915143440.2362812-1-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
new SoC specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ec..a207a57c013b 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -28,6 +28,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
@@ -140,6 +141,7 @@ allOf:
           contains:
             enum:
               - ti,am62-gpu
+              - ti,am62p-gpu
               - ti,j721s2-gpu
     then:
       properties:
-- 
2.39.5


