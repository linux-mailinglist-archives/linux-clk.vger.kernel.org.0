Return-Path: <linux-clk+bounces-14796-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F539D0C50
	for <lists+linux-clk@lfdr.de>; Mon, 18 Nov 2024 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74F08282B8E
	for <lists+linux-clk@lfdr.de>; Mon, 18 Nov 2024 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17769192597;
	Mon, 18 Nov 2024 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="H8irSJVS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151218E1A
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731923267; cv=none; b=A1CneD1uaP16uugWOqwjoOW4aqvsSeNvTU7kfWQgiZ/rI8PQpyrpszm/lrhDGdSXwyUtfKY5CyycwFML9aTifo/6lwC/GJcQu25ER4BIkDCd8BAm5i0BxYblTTJFp1DjMSz600pY6ymLNk8o3soFG18oJwFHvzGXmBP0pdqzcOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731923267; c=relaxed/simple;
	bh=DNhk+o/rPYJxkocGt/n6ACFP1HnvcJpLTbBzuk9IA/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4y/5viFJX0caQjsfsnMLctTZbiKT53NE7cYj3fIMd9CIi9UI6WUGJWL4EYE9pRQzrtiw4PNeOPfkFOLJWNNwEZP/cEKVKig4CSij/sqaL111sQ9C8moigWnHYWvczuT/jsdkPnSJAZrYifX3+eeoh/+RZW0cZkQjOc6xDctIus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=H8irSJVS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315abed18aso14802605e9.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 01:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1731923263; x=1732528063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0y/xmc/WDEeuxy81I63/jKzT8uzD3EOhKMs9VT0kt0=;
        b=H8irSJVSxYLHCE1RxAFfwURS9gknGgbmt2jamxiwpMiqlkN0jytyXr/Vm1Ttun5K3H
         iQgs395GINIsI1qas2aueip+qmZHYqE0phciHf0LNrqeiM5ap+NitdngVcr7sJ2PB4P0
         /NSjl5isFvrCXTib1/gvui9sBcOXVSim3ARaXR5YDZurA9Wik13TT0iyxSjZVoBCARHT
         Gy/hLlily0LNBxLZmYp8h2G5r49dg+X24nPIfK5Qc78IevsEXO4NPV9tD/QJSB+RP/V0
         cl4EnYx4KckcQwuYbpziANdpnEVsLEQPaxu7HWeZmKWJ7nmmWExR0qcgVlyL9ExjccAw
         46CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731923263; x=1732528063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0y/xmc/WDEeuxy81I63/jKzT8uzD3EOhKMs9VT0kt0=;
        b=IZsoXkFUcqsg5elemfqbZo+VBG/8GYCnqKYJ5lQXUuv7iy2zfFakqdJTN9df2VQX5S
         s74giOza8PXcCtmKHYYYyWSW9wZCg4/xOuOCwoRWfB7Zr1xaWIvo1eGIsQcYXo01GN/C
         h+ednzkhxnBs6ai2dSfNcxEcUAg9YHmoX2pOYBK9my1qtjkOWDV6LuLJs93pMb/c7f7p
         jZcue22I67Az941KNmF/AvkhvuhmadVcIvxBB75r3mOnrnxnMFhHYv1tJXmK7dcO3X60
         oCGyhfwf56BoucUQlgCE5/9GH0dieg1E06aRYVmYhmu0dSScGEXAHQguNJpKs4SQ0UcO
         +GyA==
X-Forwarded-Encrypted: i=1; AJvYcCVutX0NdxZtSfTODjF9rp5pMQCzfeggB9SiFsKMBGM7kmZyYooKN7ZuWrN9ro3gXrlTKyZ+9IRuYB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzLwXtRuEeQPiV8XwAzPOPu+fjIlc246q5GkDmhXqhN1/jn9a
	WcqwYOq4oGCqHz6F74Qs4eSmhzOGcIFaQ6kkmmk6T4lfJms5cctFRXewEtZCxS8=
X-Google-Smtp-Source: AGHT+IHRh2LGPJzzI8E80ul0S2acJU4gG1JMOiN2l10QsdJHSWSuQORYzJfJwvAeRDzbGLi+P7fh6g==
X-Received: by 2002:a05:600c:46c4:b0:431:251a:9dc9 with SMTP id 5b1f17b1804b1-432df77a985mr98478565e9.25.1731923263048;
        Mon, 18 Nov 2024 01:47:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da244cabsm151425285e9.8.2024.11.18.01.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 01:47:42 -0800 (PST)
Message-ID: <3153fbd0-189a-4cfc-92cd-a1cc23928d73@tuxon.dev>
Date: Mon, 18 Nov 2024 11:47:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] serial: sh-sci: Update the suspend/resume support
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, lethal@linux-sh.org,
 g.liakhovetski@gmx.de
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241115134401.3893008-1-claudiu.beznea.uj@bp.renesas.com>
 <20241115134401.3893008-4-claudiu.beznea.uj@bp.renesas.com>
 <81e131554a34c7b2f795a904f2b561f3c86e0baf.camel@pengutronix.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <81e131554a34c7b2f795a904f2b561f3c86e0baf.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 15.11.2024 17:40, Philipp Zabel wrote:
> On Fr, 2024-11-15 at 15:43 +0200, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S supports a power saving mode where power to most of the
>> SoC components is turned off. When returning from this power saving mode,
>> SoC components need to be re-configured.
>>
>> The SCIFs on the Renesas RZ/G3S need to be re-configured as well when
>> returning from this power saving mode. The sh-sci code already configures
>> the SCIF clocks, power domain and registers by calling uart_resume_port()
>> in sci_resume(). On suspend path the SCIF UART ports are suspended
>> accordingly (by calling uart_suspend_port() in sci_suspend()). The only
>> missing setting is the reset signal. For this assert/de-assert the reset
>> signal on driver suspend/resume.
>>
>> In case the no_console_suspend is specified by the user, the registers need
>> to be saved on suspend path and restore on resume path. To do this the
>> sci_console_setup() function was added. There is no need to cache/restore
>> the status or FIFO registers. Only the control registers. To differentiate
>> b/w these, the struct sci_port_params::regs was updated with a new member
>> that specifies if the register needs to be chached on suspend. Only the
>> RZ_SCIFA instances were updated with this new support as the hardware for
>> the rest of variants was missing for testing.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - none
>>
>> Changes in v2:
>> - rebased on top of the update version of patch 2/8 from
>>   this series
>>
>>  drivers/tty/serial/sh-sci.c | 53 ++++++++++++++++++++++++++++++-------
>>  1 file changed, 44 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
>> index ade151ff39d2..e53496d2708e 100644
>> --- a/drivers/tty/serial/sh-sci.c
>> +++ b/drivers/tty/serial/sh-sci.c
>> @@ -101,7 +101,7 @@ enum SCI_CLKS {
>>  		if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
>>  
>>  struct plat_sci_reg {
>> -	u8 offset, size;
>> +	u8 offset, size, suspend_cacheable;
>>  };
>>  
>>  struct sci_port_params {
>> @@ -134,6 +134,8 @@ struct sci_port {
>>  	struct dma_chan			*chan_tx;
>>  	struct dma_chan			*chan_rx;
>>  
>> +	struct reset_control		*rstc;
>> +
>>  #ifdef CONFIG_SERIAL_SH_SCI_DMA
>>  	struct dma_chan			*chan_tx_saved;
>>  	struct dma_chan			*chan_rx_saved;
>> @@ -153,6 +155,7 @@ struct sci_port {
>>  	int				rx_trigger;
>>  	struct timer_list		rx_fifo_timer;
>>  	int				rx_fifo_timeout;
>> +	unsigned int			console_cached_regs[SCIx_NR_REGS];
>>  	u16				hscif_tot;
>>  
>>  	bool has_rtscts;
>> @@ -298,17 +301,17 @@ static const struct sci_port_params sci_port_params[SCIx_NR_REGTYPES] = {
>>  	 */
>>  	[SCIx_RZ_SCIFA_REGTYPE] = {
>>  		.regs = {
>> -			[SCSMR]		= { 0x00, 16 },
>> -			[SCBRR]		= { 0x02,  8 },
>> -			[SCSCR]		= { 0x04, 16 },
>> +			[SCSMR]		= { 0x00, 16, 1 },
>> +			[SCBRR]		= { 0x02,  8, 1 },
>> +			[SCSCR]		= { 0x04, 16, 1 },
>>  			[SCxTDR]	= { 0x06,  8 },
>>  			[SCxSR]		= { 0x08, 16 },
>>  			[SCxRDR]	= { 0x0A,  8 },
>> -			[SCFCR]		= { 0x0C, 16 },
>> +			[SCFCR]		= { 0x0C, 16, 1 },
>>  			[SCFDR]		= { 0x0E, 16 },
>> -			[SCSPTR]	= { 0x10, 16 },
>> +			[SCSPTR]	= { 0x10, 16, 1 },
>>  			[SCLSR]		= { 0x12, 16 },
>> -			[SEMR]		= { 0x14, 8 },
>> +			[SEMR]		= { 0x14, 8, 1 },
>>  		},
>>  		.fifosize = 16,
>>  		.overrun_reg = SCLSR,
>> @@ -3380,6 +3383,7 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
>>  	}
>>  
>>  	sp = &sci_ports[id];
>> +	sp->rstc = rstc;
>>  	*dev_id = id;
>>  
>>  	p->type = SCI_OF_TYPE(data);
>> @@ -3507,13 +3511,34 @@ static int sci_probe(struct platform_device *dev)
>>  	return 0;
>>  }
>>  
>> +static void sci_console_setup(struct sci_port *s, bool save)
>> +{
>> +	for (u16 i = 0; i < SCIx_NR_REGS; i++) {
>> +		struct uart_port *port = &s->port;
>> +
>> +		if (!s->params->regs[i].suspend_cacheable)
>> +			continue;
>> +
>> +		if (save)
>> +			s->console_cached_regs[i] = sci_serial_in(port, i);
>> +		else
>> +			sci_serial_out(port, i, s->console_cached_regs[i]);
>> +	}
>> +}
>> +
>>  static __maybe_unused int sci_suspend(struct device *dev)
>>  {
>>  	struct sci_port *sport = dev_get_drvdata(dev);
>>  
>> -	if (sport)
>> +	if (sport) {
>>  		uart_suspend_port(&sci_uart_driver, &sport->port);
>>  
>> +		if (!console_suspend_enabled && uart_console(&sport->port))
>> +			sci_console_setup(sport, true);
>> +		else
>> +			return reset_control_assert(sport->rstc);
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -3521,8 +3546,18 @@ static __maybe_unused int sci_resume(struct device *dev)
>>  {
>>  	struct sci_port *sport = dev_get_drvdata(dev);
>>  
>> -	if (sport)
>> +	if (sport) {
>> +		if (!console_suspend_enabled && uart_console(&sport->port)) {
>> +			sci_console_setup(sport, false);
>> +		} else {
>> +			int ret = reset_control_deassert(sport->rstc);
> 
> With this, is the reset_control_deassert() in sci_parse_dt() still
> needed?

If I'm not wrongly understanding your question, yes, the
reset_control_deassert() is still needed in the sci_parse_dt() as the
sci_parse_dt() is called on probe path. After resume the sci_parse_dt() is
not called unless the driver is unbinded and then re-binded.

In case the reset_control_dessert() here fails (or not) and an
unbind/re-bind will be requested, the unbind will call
reset_control_assert() (though the devm action) and then the re-bind will
call reset_control_deassert() though sci_parse_dt(). That should be safe,
AFAICT.


> 
> Likewise, does the reset_control_assert() in sci_suspend() remove the
> need for the sci_reset_control_assert() devm action?

No, the sci_reset_control_assert() is still needed as explained above,
unless I missed your point.

Please let me know if missed your point and/or answered your question?


Thank you,
Claudiu Beznea

> 
> regards
> Philipp

