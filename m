Return-Path: <linux-clk+bounces-33001-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK4qBI/Ib2mgMQAAu9opvQ
	(envelope-from <linux-clk+bounces-33001-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:25:19 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442D496A5
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 19:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F02DDA0B959
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 16:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212072C326A;
	Tue, 20 Jan 2026 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjH6fBTc"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F3A33BBB9;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926629; cv=none; b=VNvAIlGPNWIZidLVnoa3274DQeVB31o+ynDQAXURzrZlfd54yZsEtcdtrDnNzX7iIa1c0sUt3yFQ9p5wru+u3KXMwKbggA5crcPMabSG1bVp/OAbx+NbhCiDlt6cCbHHKPpPdt+pxx4ScsRASuogpRsCZtYLIzpEYjbibxjYWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926629; c=relaxed/simple;
	bh=vIjUCN1/aJjjc1ZkXHXSm+HKwMh8UJJEGjwRNhvFFBk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cE3AQu06hzF+XWmnHk4mpynxOm41JXC5bwHHp/IQUIjOiZ7+g/yhbdyyR3gjSek00MVFji59F3zoIrN1n+XsTEWOVQikY2UaTPxAAQ5yr11QNMPFMfK4cRSrsJKfLEGK4MGpJd99/C1u/HFFqcom+JC7CPi82kSzSV/BRB4+lcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjH6fBTc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56429C16AAE;
	Tue, 20 Jan 2026 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926628;
	bh=vIjUCN1/aJjjc1ZkXHXSm+HKwMh8UJJEGjwRNhvFFBk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CjH6fBTc42FQxOY9HdoBNAdfN8NKDkc1H93MOW7f5bsWRIHYYjgXXZo21KP3gSxYO
	 kzoU/c5kNAbfkRiCjw+lfuiKzQtUa6of84HZ2qMWOSktnTg5SRR7bmQtN4LLB4wCvP
	 s21jscC1TTHkzJRjtuIXOgRHlJlJH7y0dAnTQxsP8u4oMTiQYeZUFwi1VpotL0SR5g
	 WFwZHdSGKwHUcJ8uirHGHI3o7L63YyFNwCU/X9YHBiAuB1xj4FonMNAPSnUJMN21/4
	 9Az2m6ouu58iTf14pINtHyLCyUpsb8t4nIvp/X9wC+5jAfFoDB9aDP8GTWdx2JYHfm
	 73Z9y5Ua/PwHw==
Date: Tue, 20 Jan 2026 10:30:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Ryan Wanner <ryan.wanner@microchip.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
In-Reply-To: <20260120154502.1280938-3-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
 <20260120154502.1280938-3-ada@thorsis.com>
Message-Id: <176892662758.41946.5094529075263781406.robh@kernel.org>
Subject: Re: [PATCH v3 09/19] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33001-lists,linux-clk=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-clk@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-clk,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,thorsis.com:email]
X-Rspamd-Queue-Id: 6442D496A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 16:44:43 +0100, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
> > The OTPC is clocked through the Power Management Controller (PMC).
> > The user must power on the main RC oscillator and enable the
> > peripheral clock of the OTPC prior to reading or writing the OTP
> > memory.
> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - Removed clock-names (led to confusion, and not used by the driver anyways)
>     - Removed redundant example
> 
>     v2:
>     - new patch, not present in v1
> 
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,sama7g5-pmc.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260120154502.1280938-3-ada@thorsis.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


