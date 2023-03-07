Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C992E6AE1FA
	for <lists+linux-clk@lfdr.de>; Tue,  7 Mar 2023 15:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjCGOPs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 7 Mar 2023 09:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjCGOPL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 09:15:11 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54CE92246
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 06:11:12 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso7296578wmo.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Mar 2023 06:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678198245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUtY1jkCJ+lEQR+zwoloLfHJuq21CwvzBB/rmJNHum4=;
        b=U1iRLe6d7Q3G3A0W6GfyeqRp+RpiL8wN9+qo27FijrPpcPzsnwHYNzIGhA4gwMu5BG
         t2QVqNU+izMMkC6XXTyE2FWN+6Jxjs1JLK4DcADxGmKmKNdQHew7JqCXaHvBjEHnWz7y
         oxHVBgSbKPDve/SbORUk8aNP+0PsESSvf+VXUgIxA3z2SVWFpS1ZFZT66jzhlDQGriiG
         s2kWmD6LBcaldSY2fBSqTjxC+qzgeMautVGHwStU+nTZ9UQduha1jqq9wULejlh9RI/7
         GVnGuMXI4fYB+AVi62yQG+dVmJu3sgTIWDCrMsxG4O4B6249OSpeozV2p1jgFPLdPxFA
         UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678198245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUtY1jkCJ+lEQR+zwoloLfHJuq21CwvzBB/rmJNHum4=;
        b=pLA16JhlKmtKHmm1OXYZEJtGMzdwL0eYrBm153EN+7DsONQEVBoxiNk3+zE2A/7Srl
         SqwTTcZaf9fA8wdronZMUwJiuyeG5DzMuGUfG7+poGrwYtD0dG+ZiQjTWILF867h+Z2o
         vC1UVgEevfU1PSiYbhazTIfFDnp6Nd2vZZ4zTTKnEck6+ojXwW06J6g115HAw78g+QV1
         mkpWzPI0cNMKYEVTgaV9bPNE+BPr+HK7Nx3Wy8R3JqPZeqk5/4bQi4pIXWOU5CxBLiiG
         HRdMwuL0hmdtr/QBaYldP3XwtUcwaMF9+8PaFTbX4UxqtkppN5vVMXFk/69wbThHejZI
         azTA==
X-Gm-Message-State: AO0yUKU6N5+4l6DqHFWUPQ2jbJwYKBWBZynmVRUqVGSFMB6dm7g94vM7
        30KGW40RaRd/r4vi9r67k5/52w==
X-Google-Smtp-Source: AK7set+u7xUZoMkjrprFUUDCfkfI6OVF8F2orlb7+FMnodlR196UVsjqLTiGldK3h8bIQfdMmNAntQ==
X-Received: by 2002:a05:600c:4509:b0:3eb:3c76:c241 with SMTP id t9-20020a05600c450900b003eb3c76c241mr12362479wmo.13.1678198244550;
        Tue, 07 Mar 2023 06:10:44 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600c355000b003dc4480df80sm18701052wmq.34.2023.03.07.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 06:10:43 -0800 (PST)
Date:   Tue, 7 Mar 2023 15:10:41 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [RFC PATCH v5 1/4] dpll: Add DPLL framework base functions
Message-ID: <ZAdF4TyBfOCIPo6G@nanopsycho>
References: <20230117180051.2983639-1-vadfed@meta.com>
 <20230117180051.2983639-2-vadfed@meta.com>
 <Y8l63RF8DQz3i0LY@nanopsycho>
 <DM6PR11MB46575F782A66620E1A2D04229BCC9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y9ke/+0z3r6WOjWn@nanopsycho>
 <DM6PR11MB46576B19A5DBA46C20AC26679BDA9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <Y+JdAVZ5hPxrRgvT@nanopsycho>
 <DM6PR11MB4657468307AD658AD2A763FB9BB79@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657468307AD658AD2A763FB9BB79@DM6PR11MB4657.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Mar 07, 2023 at 01:23:27PM CET, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Tuesday, February 7, 2023 3:15 PM
>>
>>Mon, Feb 06, 2023 at 03:00:09AM CET, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Tuesday, January 31, 2023 3:01 PM
>>>>To: Kubalewski, Arkadiusz <arkadiusz.kubalewski@intel.com>
>>>>Cc: Vadim Fedorenko <vadfed@meta.com>; Jakub Kicinski
>>>><kuba@kernel.org>; Jonathan Lemon <jonathan.lemon@gmail.com>; Paolo
>>>>Abeni <pabeni@redhat.com>; netdev@vger.kernel.org;
>>>>linux-arm-kernel@lists.infradead.org; linux- clk@vger.kernel.org;
>>>>Olech, Milena <milena.olech@intel.com>; Michalik, Michal
>>>><michal.michalik@intel.com>
>>>>Subject: Re: [RFC PATCH v5 1/4] dpll: Add DPLL framework base
>>>>functions
>>>>
>>>>Fri, Jan 27, 2023 at 07:12:41PM CET, arkadiusz.kubalewski@intel.com
>>>wrote:
>>>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>>>Sent: Thursday, January 19, 2023 6:16 PM
>>>>>>
>>>>>>Tue, Jan 17, 2023 at 07:00:48PM CET, vadfed@meta.com wrote:
>>
>>[...]
>>
>>
>>>>>>>+			 struct dpll_pin_ops *ops, void *priv) {
>>>>>>>+	struct dpll_pin *pin;
>>>>>>>+	int ret;
>>>>>>>+
>>>>>>>+	mutex_lock(&dpll_pin_owner->lock);
>>>>>>>+	pin = dpll_pin_get_by_description(dpll_pin_owner,
>>>>>>>+					  shared_pin_description);
>>>>>>>+	if (!pin) {
>>>>>>>+		ret = -EINVAL;
>>>>>>>+		goto unlock;
>>>>>>>+	}
>>>>>>>+	ret = dpll_pin_register(dpll, pin, ops, priv);
>>>>>>>+unlock:
>>>>>>>+	mutex_unlock(&dpll_pin_owner->lock);
>>>>>>>+
>>>>>>>+	return ret;
>>>>>>
>>>>>>I don't understand why there should be a separate function to
>>>>>>register the shared pin. As I see it, there is a pin object that
>>>>>>could be registered with 2 or more dpll devices. What about having:
>>>>>>
>>>>>>pin = dpll_pin_alloc(desc, type, ops, priv)
>>>>>>dpll_pin_register(dpll_1, pin); dpll_pin_register(dpll_2, pin);
>>>>>>dpll_pin_register(dpll_3, pin);
>>>>>>
>>>>>
>>>>>IMHO your example works already, but it would possible only if the
>>>>>same driver instance initializes all dplls.
>>>>
>>>>It should be only one instance of dpll to be shared between driver
>>>>instances as I wrote in the reply to the "ice" part. There might he
>>>>some pins created alongside with this.
>>>>
>>>
>>>pin = dpll_pin_alloc(desc, type, ops, priv) dpll_pin_register(dpll_1,
>>>pin); dpll_pin_register(dpll_2, pin); dpll_pin_register(dpll_3, pin); ^
>>>there is registration of a single pin by a 3 dpll instances, and a
>>>kernel module instance which registers them has a reference to the pin
>>>and all dplls, thus it can just register them all without any problems,
>>>don't need to call dpll_shared_pin_register(..).
>>>
>>>Now imagine 2 kernel module instances.
>>>One (#1) creates one dpll, registers pins with it.
>>>Second (#2) creates second dpll, and want to use/register pins of dpll
>>>registered by the first instance (#1).
>>
>>Sure, both instances should be available to both module instances, using
>>the suggested get/put create/reference system.
>>Whichever module instance does register shared pin can use
>>dpll_pin_register(), I see no problem with that.
>>
>
>In v6 those suggestions are implemented.
>AFAIK Vadim shall send it soon.

Good.


>
>>
>>>
>>>>My point is, the first driver instance which creates dpll registers
>>>>also the pins. The other driver instance does not do anything, just
>>>>gets reference to the dpll.
>>>>
>>>>On cleanup path, the last driver instance tearing down would
>>>>unregister dpll pins (Could be done automatically by dpll_device_put()).
>>>>
>>>>There might be some other pins (Synce) created per driver instance
>>>>(per-PF). You have to distinguish these 2 groups.
>>>>
>>>>
>>>>>dpll_shared_pin_register is designed for driver instances without the
>>>>>pin
>>>>
>>>>I think we need to make sure the terms are correct "sharing" is
>>>>between multiple dpll instances. However, if 2 driver instances are
>>>>sharing the same dpll instance, this instance has pins. There is no
>>>>sharing unless there is another dpll instance in picture. Correct?
>>>>
>>>
>>>Yes!
>>>If two kernel module intances sharing a dpll instance, the pins belong
>>>to the dpll instance, and yes each kernel module instance can register
>>>pins with that dpll instance just with: dpll_pin_register(dpll_1, pin);
>>>
>>>dpll_shared_pin_register(..) shall be used when separated kernel module
>>>instances are initializing separated dpll instances, and those
>>>instances are
>>
>>Why exacly would they do that? Could you please draw me an example?
>>
>
>I think we shall not follow this discussion as in v6 we already
>have the mechanics you suggested, but sure:

Ok.


>+----------+                 
>|i0 - GPS  |--------------\
>+----------+              |
>+----------+              |
>|i1 - SMA1 |------------\ |
>+----------+            | |
>+----------+            | |
>|i2 - SMA2 |----------\ | |
>+----------+          | | |
>                      | | |
>+---------------------|-|-|-------------------------------------------+
>| Channel A / FW0     | | |     +-------------+   +---+   +--------+  |
>|                     | | |-i0--|Synchronizer0|---|   |---| PHY0.0 |--|
>|         +---+       | | |     |             |   |   |   +--------+  |
>| PHY0.0--|   |       | |---i1--|             |---| M |---| PHY0.1 |--|
>|         |   |       | | |     | +-----+     |   | A |   +--------+  |
>| PHY0.1--| M |       |-----i2--| |DPLL0|     |   | C |---| PHY0.2 |--|
>|         | U |       | | |     | +-----+     |   | 0 |   +--------+  |
>| PHY0.2--| X |--+----------i3--| +-----+     |---|   |---| ...    |--|
>|         | 0 |  |    | | |     | |DPLL1|     |   |   |   +--------+  |
>| ...   --|   |  | /--------i4--| +-----+     |---|   |---| PHY0.7 |--|
>|         |   |  | |  | | |     +-------------+   +---+   +--------+  |
>| PHY0.7--|   |  | |  | | |                                           |
>|         +---+  | |  | | |                                           |
>+----------------|-|--|-|-|-------------------------------------------+
>| Channel B / FW1| |  | | |     +-------------+   +---+   +--------+  |
>|                | |  | | \-i0--|Synchronizer1|---|   |---| PHY1.0 |--|
>|         +---+  | |  | |       |             |   |   |   +--------+  |
>| PHY1.0--|   |  | |  | \---i1--|             |---| M |---| PHY1.1 |--|
>|         |   |  | |  |         | +-----+     |   | A |   +--------+  |
>| PHY1.1--| M |  | |  \-----i2--| |DPLL0|     |   | C |---| PHY1.2 |--|
>|         | U |  | |            | +-----+     |   | 1 |   +--------+  |
>| PHY1.2--| X |  \-|--------i3--| +-----+     |---|   |---| ...    |--|
>|         | 1 |    |            | |DPLL1|     |   |   |   +--------+  |
>| ...   --|   |----+--------i4--| +-----+     |---|   |---| PHY1.7 |--|
>|         |   |                 +-------------+   +---+   +--------+  |
>| PHY1.7--|   |                                                       |
>|         +---+                                                       |
>+---------------------------------------------------------------------+
>
>>
>>>physically sharing their pins.
>>>
>>>>
>>
>>[...]
>>
>>
>>>>>>>+static int dpll_msg_add_pin_modes(struct sk_buff *msg,
>>>>>>>+				   const struct dpll_device *dpll,
>>>>>>>+				   const struct dpll_pin *pin) {
>>>>>>>+	enum dpll_pin_mode i;
>>>>>>>+	bool active;
>>>>>>>+
>>>>>>>+	for (i = DPLL_PIN_MODE_UNSPEC + 1; i <= DPLL_PIN_MODE_MAX; i++) {
>>>>>>>+		if (dpll_pin_mode_active(dpll, pin, i, &active))
>>>>>>>+			return 0;
>>>>>>>+		if (active)
>>>>>>>+			if (nla_put_s32(msg, DPLLA_PIN_MODE, i))
>>>>>>
>>>>>>Why this is signed?
>>>>>>
>>>>>
>>>>>Because enums are signed.
>>>>
>>>>You use negative values in enums? Don't do that here. Have all netlink
>>>>atrributes unsigned please.
>>>>
>>>
>>>No, we don't use negative values, but enum is a signed type by itself.
>>>Doesn't seem right thing to do, put signed-type value into unsigned type TLV.
>>>This smells very bad.
>>
>>Well, then all existing uses that carry enum over netlink attributes smell
>>bad. The enum values are all unsigned, I see no reason to use S*.
>>Please be consistent with the rest of the Netlink uAPI.
>>
>
>Yes, exactly, don't know why to follow bad practicies, saying "that's how it's
>done". Is there any reasoning behind this?

Where exactly do you pass negative value? If you don't use U*. Simple as
that :)


>
>>
>>[...]
>>
>>>>>>>+
>>>>>>>+/* dpll_pin_signal_type - signal types
>>>>>>>+ *
>>>>>>>+ * @DPLL_PIN_SIGNAL_TYPE_UNSPEC - unspecified value
>>>>>>>+ * @DPLL_PIN_SIGNAL_TYPE_1_PPS - a 1Hz signal
>>>>>>>+ * @DPLL_PIN_SIGNAL_TYPE_10_MHZ - a 10 MHz signal
>>>>>>
>>>>>>Why we need to have 1HZ and 10MHZ hardcoded as enums? Why can't we
>>>>>>work with HZ value directly? For example, supported freq:
>>>>>>1, 10000000
>>>>>>or:
>>>>>>1, 1000
>>>>>>
>>>>>>freq set 10000000
>>>>>>freq set 1
>>>>>>
>>>>>>Simple and easy.
>>>>>>
>>>>>
>>>>>AFAIR, we wanted to have most commonly used frequencies as enums +
>>>>>custom_freq for some exotic ones (please note that there is also
>>>>>possible 2PPS, which is
>>>>>0.5 Hz).
>>>>
>>>>In this exotic case, user might add divider netlink attribute to
>>>>divide the frequency pass in the attr. No problem.
>>>>
>>>>
>>>>>This was design decision we already agreed on.
>>>>>The userspace shall get definite list of comonly used frequencies
>>>>>that can be used with given HW, it clearly enums are good for this.
>>>>
>>>>I don't see why. Each instance supports a set of frequencies. It would
>>>>pass the values to the userspace.
>>>>
>>>>I fail to see the need to have some fixed values listed in enums.
>>>>Mixing approaches for a single attribute is wrong. In ethtool we also
>>>>don't have enum values for 10,100,1000mbits etc. It's just a number.
>>>>
>>>
>>>In ethtool there are defines for linkspeeds.
>>>There must be list of defines/enums to check the driver if it is supported.
>>>Especially for ANY_FREQ we don't want to call driver 25 milions times or
>>>more.
>>
>>Any is not really *any* is it? A simple range wouldn't do then? It would be
>>much better to tell the user the boundaries.
>>
>
>In v6 those suggestions are implemented.

Good.


>
>>
>>>
>>>Also, we have to move supported frequencies to the dpll_pin_alloc as it
>>>is constant argument, supported frequencies shall not change @ runtime?
>>>In such case there seems to be only one way to pass in a nice way, as a
>>>bitmask?
>>
>>array of numbers (perhaps using defines for most common values), I don't
>>see any problem in that. But you are talking about in-kernel API. Does not
>>matter that much. What we are discussing is uAPI and that matters a lot.
>>
>>
>>>
>>>Back to the userspace part, do you suggest to have DPLLA_PIN_FREQ
>>>attribute and translate kernelspace enum values to userspace defines
>>>like DPLL_FREQ_1_HZ, etc? also with special define for supported ones
>>>ANY_FREQ?
>>
>>Whichever is convenient. My focus here is uAPI.
>>
>
>In v6 those suggestions are implemented.

Ok.


>
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>+ * @DPLL_PIN_SIGNAL_TYPE_CUSTOM_FREQ - custom frequency signal,
>>>>>>>+ value
>>>>>>>defined
>>>>>>>+ *	with pin's DPLLA_PIN_SIGNAL_TYPE_CUSTOM_FREQ attribute
>>>>>>>+ **/
>>>>>>>+enum dpll_pin_signal_type {
>>>>>>>+	DPLL_PIN_SIGNAL_TYPE_UNSPEC,
>>>>>>>+	DPLL_PIN_SIGNAL_TYPE_1_PPS,
>>>>>>>+	DPLL_PIN_SIGNAL_TYPE_10_MHZ,
>>>>>>>+	DPLL_PIN_SIGNAL_TYPE_CUSTOM_FREQ,
>>>>>>>+
>>>>>>>+	__DPLL_PIN_SIGNAL_TYPE_MAX,
>>>>>>>+};
>>>>>>>+
>>>>>>>+#define DPLL_PIN_SIGNAL_TYPE_MAX (__DPLL_PIN_SIGNAL_TYPE_MAX - 1)
>>>>>>>+
>>>>>>>+/* dpll_pin_mode - available pin states
>>>>>>>+ *
>>>>>>>+ * @DPLL_PIN_MODE_UNSPEC - unspecified value
>>>>>>>+ * @DPLL_PIN_MODE_CONNECTED - pin connected
>>>>>>>+ * @DPLL_PIN_MODE_DISCONNECTED - pin disconnected
>>>>>>>+ * @DPLL_PIN_MODE_SOURCE - pin used as an input pin
>>>>>>>+ * @DPLL_PIN_MODE_OUTPUT - pin used as an output pin  **/ enum
>>>>>>>+dpll_pin_mode {
>>>>>>>+	DPLL_PIN_MODE_UNSPEC,
>>>>>>>+	DPLL_PIN_MODE_CONNECTED,
>>>>>>>+	DPLL_PIN_MODE_DISCONNECTED,
>>>>>>>+	DPLL_PIN_MODE_SOURCE,
>>>>>>>+	DPLL_PIN_MODE_OUTPUT,
>>>>>>
>>>>>>I don't follow. I see 2 enums:
>>>>>>CONNECTED/DISCONNECTED
>>>>>>SOURCE/OUTPUT
>>>>>>why this is mangled together? How is it supposed to be working. Like
>>>>>>a bitarray?
>>>>>>
>>>>>
>>>>>The userspace shouldn't worry about bits, it recieves a list of
>>>>attributes.
>>>>>For current/active mode: DPLLA_PIN_MODE, and for supported modes:
>>>>>DPLLA_PIN_MODE_SUPPORTED. I.e.
>>>>>
>>>>>	DPLLA_PIN_IDX			0
>>>>>	DPLLA_PIN_MODE			1,3
>>>>>	DPLLA_PIN_MODE_SUPPORTED	1,2,3,4
>>>>
>>>>I believe that mixing apples and oranges in a single attr is not correct.
>>>>Could you please split to separate attrs as drafted below?
>>>>
>>>>>
>>>>>The reason for existance of both DPLL_PIN_MODE_CONNECTED and
>>>>>DPLL_PIN_MODE_DISCONNECTED, is that the user must request it somehow,
>>>>>and bitmask is not a way to go for userspace.
>>>>
>>>>What? See nla_bitmap.
>>>>
>>>
>>>AFAIK, nla_bitmap is not yet merged.
>>
>>NLA_BITFIELD32
>>
>>
>>>
>>>>Anyway, why can't you have:
>>>>DPLLA_PIN_CONNECTED     u8 1/0 (bool)
>>>>DPLLA_PIN_DIRECTION     enum { SOURCE/OUTPUT }
>>>
>>>Don't get it, why this shall be u8 with bool value, doesn't make much
>>>sense for userspace.
>>
>>Could be NLA_FLAG.
>>
>>
>>>All the other attributes have enum type, we can go with separated
>>>attribute:
>>>DPLLA_PIN_STATE		enum { CONNECTED/DISCONNECTED }
>>
>>Yeah, why not. I think this is probably better and more explicit than
>>NLA_FLAG.
>>
>>
>>>Just be consistent and clear, and yes u8 is enough it to keep it, as
>>>well as all of attribute enum values, so we can use u8 instead of u32 for
>>>all of them.
>>
>>Yes, that is what is done normally for attrs like this.
>>
>>
>
>In v6, there are enums and attributes:
>DPLL_A_PIN_STATE	enum { CONNECTED/DISCONNECTED }
>DPLL_A_PIN_DIRECTION	enum { SOURCE/OUTPUT }
>
>also new capabilities attributes DPLL_A_PIN_DPLL_CAPS
>a bitmap - implicit from u32 value.


Looking forward to it.


>
>>>
>>>Actually for "connected/disconnected"-part there are 2 valid use-cases
>>>on my
>>>mind:
>>>- pin can be connected with a number of "parents" (dplls or muxed-pins)
>>>- pin is disconnected entirely
>>>Second case can be achieved with control over first one, thus not need
>>>for any special approach here. Proper control would be to let userspace
>>>connect or disconnect a pin per each node it can be connected with, right?
>>>
>>>Then example dump of "get-pins" could look like this:
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		0
>>>	DPLLA_PIN_TYPE		DPLL_PIN_TYPE_EXT
>>>	DPLLA_PIN_DIRECTION	SOURCE
>>>	...
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		0
>>>		DPLLA_NAME		pci_0000:00:00.0
>>
>>Nit, make sure you have this as 2 attrs, busname, devname.
>
>Sure.

Good.


>
>>
>>
>>>		DPLLA_PIN_STATE		CONNECTED
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		1
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>>
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		1
>>>	DPLLA_PIN_TYPE		DPLL_PIN_TYPE_MUX
>>>	DPLLA_PIN_DIRECTION	SOURCE
>>>	...
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		0
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		1
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		CONNECTED
>>>
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		2
>>>	DPLLA_PIN_TYPE		DPLL_PIN_TYPE_MUX
>>>	DPLLA_PIN_DIRECTION	SOURCE
>>>	...
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		0
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		1
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>
>>Okay.
>>
>>
>>>
>>>(similar for muxed pins)
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		3
>>>	DPLLA_PIN_TYPE		DPLL_PIN_TYPE_SYNCE_ETH_PORT
>>>	DPLLA_PIN_DIRECTION	SOURCE
>>>	DPLLA_PIN_PARENT		(nested)
>>>		DPLLA_PIN_IDX		1
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>>	DPLLA_PIN_PARENT		(nested)
>>>		DPLLA_PIN_IDX		2
>>>		DPLLA_PIN_STATE		CONNECTED
>>>
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		4
>>>	DPLLA_PIN_TYPE		DPLL_PIN_TYPE_SYNCE_ETH_PORT
>>>	DPLLA_PIN_DIRECTION	SOURCE
>>>	DPLLA_PIN_PARENT		(nested)
>>>		DPLLA_PIN_IDX		1
>>>		DPLLA_PIN_STATE		CONNECTED
>>>	DPLLA_PIN_PARENT		(nested)
>>>		DPLLA_PIN_IDX		2
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>
>>Looks fine.
>>
>>
>>>
>>>For DPLL_MODE_MANUAL a DPLLA_PIN_STATE would serve also as signal
>>>selector mechanism.
>>
>>Yep, I already make this point in earlier rfc review comment.
>>
>
>Thanks for that :)
>
>>
>>>In above example DPLL_ID=0 has only "connected" DPLL_PIN_IDX=0, now
>>>when different pin "connect" is requested:
>>>
>>>dpll-set request:
>>>DPLLA_DPLL	(nested)
>>>	DPLLA_ID=0
>>>	DPLLA_NAME=pci_0000:00:00.0
>>>DPLLA_PIN
>>>	DPLLA_PIN_IDX=2
>>>	DPLLA_PIN_CONNECTED=1
>>>
>>>Former shall "disconnect"..
>>>And now, dump pin-get:
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		0
>>>	...
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		0
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		DISCONNECTED
>>>...
>>>DPLL_PIN	(nested)
>>>	DPLLA_PIN_IDX		2
>>>	...
>>>	DPLLA_DPLL			(nested)
>>>		DPLLA_ID		0
>>>		DPLLA_NAME		pci_0000:00:00.0
>>>		DPLLA_PIN_STATE		CONNECTED
>>>
>>>At least that shall happen on hardware level, right?
>>>
>>>As I can't find a use-case to have a pin "connected" but not "selected"
>>>in case of DPLL_MODE_MANUAL.
>>
>>Exactly.
>>
>>
>>>
>>>A bit different is with DPLL_MODE_AUTOMATIC, the pins that connects
>>>with dpll directly could be all connected, and their selection is
>>>auto-controlled with a DPLLA_PIN_PRIO.
>>>But still the user may also request to disconnect a pin - not use it at
>>>all (instead of configuring lowest priority - which allows to use it,
>>>if all other pins propagate invalid signal).
>>>
>>>Thus, for DPLL_MODE_AUTOMATIC all ablove is the same with a one
>>>difference, each pin/dpll pair would have a prio, like suggested in the
>>other email.
>>>DPLLA_PIN	(nested)
>>>	...
>>>	DPLLA_DPLL	(nested)
>>>		...
>>>		DPLLA_PIN_CONNECTED	<connected value>
>>>		DPLLA_PIN_STATE		<prio value>
>>
>>I think you made a mistake. Should it be:
>>		DPLLA_PIN_STATE		<connected value>
>>		DPLLA_PIN_PRIO		<prio value>
>>?
>>
>
>Yes, exactly.
>
>>
>>>
>>>Which basically means that both DPLL_A_PIN_PRIO and DPLLA_PIN_STATE
>>>shall be a property of a PIN-DPLL pair, and configured as such.
>>
>>Yes.
>>
>>
>>>
>>>
>>>>DPLLA_PIN_CAPS          nla_bitfield(CAN_CHANGE_CONNECTED,
>>>>CAN_CHANGE_DIRECTION)
>>>>
>>>>We can use the capabilitis bitfield eventually for other purposes as
>>>>well, it is going to be handy I'm sure.
>>>>
>>>
>>>Well, in general I like the idea, altough the details...
>>>We have 3 configuration levels:
>>>- DPLL
>>>- DPLL/PIN
>>>- PIN
>>>
>>>Considering that, there is space for 3 of such CAPABILITIES attributes, but:
>>>- DPLL can only configure MODE for now, so we can only convert
>>>DPLL_A_MODE_SUPPORTED to a bitfield, and add DPLL_CAPS later if
>>>required
>>
>>Can't do that. It's uAPI, once you have ATTR there, it's there for
>>eternity...
>>
>
>I am not saying to remove something but add in the future.
>
>>
>>>- DPLL/PIN pair has configurable DPLLA_PIN_PRIO and DPLLA_PIN_STATE, so
>>>we could introduce DPLLA_PIN_DPLL_CAPS for them
>>
>>Yeah.
>>
>>
>>>- PIN has now configurable frequency (but this is done by providing
>>>list of supported ones - no need for extra attribute). We already know
>>>that pin shall also have optional features, like phase offset, embedded
>>>sync.
>>>For embedded sync if supported it shall also be a set of supported
>>>frequencies.
>>>Possibly for phase offset we could use similar CAPS field, but don't
>>>think will manage this into next version.
>>>
>>>>
>>>>
>>>>>
>>>>>
>>>>>>
>>>>>>>+
>>>>>>>+	__DPLL_PIN_MODE_MAX,
>>>>>>>+};
>>>>>>>+
>>>>
>>>>[...]
>>>>
>>>>
>>>>>>>+/**
>>>>>>>+ * dpll_mode - Working-modes a dpll can support. Modes
>>>>>>>+differentiate
>>>>>>>>how
>>>>>>>+ * dpll selects one of its sources to syntonize with a source.
>>>>>>>+ *
>>>>>>>+ * @DPLL_MODE_UNSPEC - invalid
>>>>>>>+ * @DPLL_MODE_MANUAL - source can be only selected by sending a
>>>>>>>+ request
>>>>>>>to dpll
>>>>>>>+ * @DPLL_MODE_AUTOMATIC - highest prio, valid source, auto
>>>>>>>+ selected by
>>>>>>>dpll
>>>>>>>+ * @DPLL_MODE_HOLDOVER - dpll forced into holdover mode
>>>>>>>+ * @DPLL_MODE_FREERUN - dpll driven on system clk, no holdover
>>>>>>>available
>>>>>>>+ * @DPLL_MODE_NCO - dpll driven by Numerically Controlled
>>>>>>>+ Oscillator
>>>>>>
>>>>>>Why does the user care which oscilator is run internally. It's
>>>>>>freerun, isn't it? If you want to expose oscilator type, you should
>>>>>>do it elsewhere.
>>>>>>
>>>>>
>>>>>In NCO user might change frequency of an output, in freerun cannot.
>>>>
>>>>How this could be done?
>>>>
>>>
>>>I guess by some internal synchronizer frequency dividers. Same as other
>>>output (different then input) frequencies are achievable there.
>>
>>I ment uAPI wise. Speak Netlink.
>>
>
>1. DPLL_MODE_NCO is returned with DPLL_A_MODE_SUPPORTED when HW supports it.
>2. DPLL_MODE_NCO is requested by the user if user wants control output
>frequency or output frequency offset of a dpll.
>
>From the documentation of ZL80032:
>* Numerically controlled oscillator (NCO) behavior allows system software to 
>steer DPLL frequency or synthesizer frequency with resolution better than 0.005
>ppt
>* Similar to freerun mode, but with frequency control. The output clock is the
>configured frequency with a frequency offset specified by the dpll_df_offset_x
>register. This write-only register changes the output frequency offset of the
>DPLL

Okay, document it properly then, best in the header exposing this enum
value.


Thanks!

>
>
>Thank you,
>Arkadiusz
>
>>>
>>>Thanks,
>>>Arkadiusz
>>>
>>>>
>>>>[...]
>>>
